import Foundation

enum ProfileOption: CaseIterable, CustomStringConvertible {
    case articles
    case job
    case education
    case project
    case contact

    var idName: String {
        switch self {
        case .articles: "articles"
        case .job: "jobs"
        case .education: "education"
        case .project: "project"
        case .contact: "contact"
        }
    }

    var icon: String {
        switch self {
        case .articles: "📰"
        case .job: "⌨️"
        case .education: "📚"
        case .project: "⚙️"
        case .contact: "👥"
        }
    }

    var description: String {
        description(for: .english)
    }

    func description(for language: PortfolioLanguage) -> String {
        switch (self, language) {
        case (.articles, .english): "Articles"
        case (.articles, .spanish): "Articulos"
        case (.job, .english): "Jobs"
        case (.job, .spanish): "Trabajos"
        case (.education, .english): "Education"
        case (.education, .spanish): "Educación"
        case (.project, .english): "Projects"
        case (.project, .spanish): "Proyectos"
        case (.contact, .english): "Contact"
        case (.contact, .spanish): "Contacto"
        }
    }

    /// Combines the icon and the raw value description.
    /// - Parameters:
    ///   - language: The language in which the description is desired.
    ///   - uppercased: A boolean that determines whether the raw value should be uppercased. Default is `false`.
    /// - Returns: A string with the icon and the corresponding description, optionally in uppercase.
    func iconWithDescription(for language: PortfolioLanguage, uppercased: Bool = false) -> String {
        let description = self.description(for: language)
        return "\(icon) \(uppercased ? description.uppercased() : description)"
    }
}
