---
title: My first data race
description: A technical article explaining how a concurrency refactor in Swift led to a data race, and how to solve it using actor patterns.
author: Jorge Calderita
date: 2025-05-21 10:00
layout: ArticleView
tags: Vapor, Swift
image: /images/articles/MyFirstDataRace.webp
imageDescription: “My first data race.” A stressed programmer stares at his laptop while a Scalextric track crashes nearby, symbolizing the chaos of a concurrency bug in his code.
language: english
published: true
---
# Title

## From sequential refactoring to a concurrency bug in Swift

During a refactoring process to convert a previously sequential feature into a concurrent one, I encountered a classic problem: guaranteeing the uniqueness of records when multiple tasks try to create events simultaneously. Although the goal was to improve performance by processing thousands of sporting events in parallel using Swift, the transition exposed a typical concurrency challenge: avoiding duplicates and maintaining data integrity under simultaneous access.

---

### Actor with array
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

**Advantages:**  
- Simplicity.  
- Safety against race conditions.

**Drawback:**  
- Inefficient search in large volumes `O(n)`.
---
### Actor with dictionary

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

**Advantages:**  
- Fast search and insertion `O(1)`.  
- Ideal for large data volumes.

**Bug:**  
- Logical race condition

---
### Logical race condition

When multiple concurrent tasks try to create the same event, they may all check that it does not exist and then proceed to create it at the same time.  
Only one of the resulting instances gets stored, while the rest become "orphans," which causes inconsistencies and broken references in other data structures.

*For example: two concurrent tasks check if an event exists. Both see that it does not, both create it, but only one survives in the dictionary; the other reference is now lost.*

---
### Solution

To prevent this, it is necessary to serialize not just access but also creation by key:  
If a creation is already in progress for that key, concurrent tasks must wait for the result of the first one, ensuring that all share exactly the same resource.

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

### Lessons learned

- An actor alone does not prevent “check-then-act” logical race conditions.
- In concurrent scenarios, serializing resource construction by key is fundamental for data integrity.
- It is essential to test under load and concurrent scenarios, not just in sequential mode.
