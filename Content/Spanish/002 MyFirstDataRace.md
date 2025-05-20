---
title: My first data race
description: Artículo técnico sobre cómo una refactorización concurrente en Swift provocó un data race y su solución eficiente usando actores.
author: Jorge Calderita
date: 2025-05-21 10:00
layout: ArticleView
tags: Vapor, Swift
image: /images/articles/MyFirstDataRace.webp
imageDescription: “My first data race”. Un programador agobiado mira su portátil mientras un Scalextric choca a su lado, simbolizando el caos de un error de concurrencia en su código.
language: spanish
published: true
---
# Title

## De la refactorización secuencial a un bug de concurrencia en Swift

Durante una refactorización para convertir una funcionalidad originalmente secuencial en concurrente, me encontré con un clásico problema: garantizar la unicidad de los registros cuando múltiples tareas intentan crear eventos al mismo tiempo. Aunque el objetivo era mejorar el rendimiento procesando miles de eventos deportivos en paralelo usando Swift, la transición expuso un reto típico de concurrencia: evitar duplicados y mantener la integridad de los datos bajo acceso simultáneo.

---
### Actor con array.

```swift
private actor EventsActor {
    private var events: [SportEventModel] = []

    func getOrCreate(name: String, cityId: UUID, build: () async throws -> SportEventModel) async throws -> SportEventModel {
        if let event = events.first(where: { $0.normalizedName == name && $0.$city.id == cityId }) {
            return event
        }
        let event = try await build()
        events.append(event)
        return event
    }

    var all: [SportEventModel] { events }
}
```

**Ventajas:**  
- Simplicidad.
- Seguridad frente a condiciones de carrera.

**Inconveniente:**  
- Búsqueda ineficiente en grandes volúmenes `O(n)`.
---
### Actor con diccionario

```swift
private actor EventsActor {
    private var events: [String: SportEventModel] = [:]

    func getOrCreate(name: String, cityId: UUID, build: () async throws -> SportEventModel) async throws -> SportEventModel {
        let key = "\(name)\(cityId.uuidString)"
        if let event = events[key] { return event }
        let event = try await build()
        events[key] = event
        return event
    }

    var all: [SportEventModel] { Array(events.values) }
}
```

**Ventajas:**  
- Búsqueda e inserción rápida `O(1)`.
- Ideal para grandes volúmenes de datos.

**Bug:**  
- Condición de carrera lógica

### Condición de carrera lógica

Cuando varias tareas concurrentes intentan crear el mismo evento, todas pueden comprobar que no existe y proceder a crearlo a la vez.  
Solo una de las instancias resultantes se almacena, el resto quedan “huérfanas”, lo que provoca inconsistencias y referencias rotas en otras estructuras de datos.

---
### Solución

La clave está en serializar la creación por clave:  
Si existe una creación en curso para esa clave, las tareas concurrentes deben esperar al resultado de la primera, asegurando que todas comparten exactamente el mismo recurso.

```swift
private actor EventsActor {
    private var events: [String: SportEventModel] = [:]
    private var builds: [String: Task&lt;SportEventModel, Error&gt;] = [:]
    
    func getOrCreate(name: String, cityId: UUID, build: @Sendable @escaping () async throws -> SportEventModel) async throws -> SportEventModel {
        let key = "\(name)\(cityId.uuidString)"
        if let event = events[key] { return event }
        if let building = builds[key] { return try await building.value }
        
        let buildTask = Task { try await build() }
        builds[key] = buildTask
        
        let event = try await buildTask.value
        events[key] = event
        builds.removeValue(forKey: key)
        return event
    }
    
    var all: [SportEventModel] { Array(events.values) }
}
```

---
### Lecciones aprendidas

- Un actor por sí solo no previene las condiciones de carrera lógicas de tipo “check-then-act”.
- En concurrencia, serializar la construcción de recursos por clave es fundamental para la integridad de los datos.
- Es imprescindible probar bajo carga y escenarios concurrentes, no solo en modo secuencial.

