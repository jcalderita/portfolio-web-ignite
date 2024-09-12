//
//  File.swift
//  
//
//  Created by Jorge Calderita on 10/9/24.
//

import Foundation

enum ProfileOption: String, CaseIterable {
    case job = "Jobs"
    case education = "Education"
    case project = "Projects"
    case contact = "Contact"
    
    var idName: String {
        switch self {
            case .job: "jobs"
            case .education: "education"
            case .project: "project"
            case .contact: "contact"
        }
    }
    
    var icon: String {
        switch self {
            case .job: "⌨️"
            case .education: "📚"
            case .project: "⚙️"
            case .contact: "👥"
        }
    }
    
    /// Combines the icon and the raw value description.
    /// - Parameter uppercased: A boolean that determines whether the raw value should be uppercased. Default is `false`.
    /// - Returns: A string with the icon and the corresponding description, optionally in uppercase.
    func iconWithDescription(uppercased: Bool = false) -> String {
        "\(icon) \(uppercased ? rawValue.uppercased() : rawValue)"
    }
}
