//
//  File.swift
//  
//
//  Created by Jorge Calderita on 10/9/24.
//

import Foundation

enum TypeOfExperience: String {
    case job = "Work Experience"
    case education = "Education"
    case contact = "Contact"
    
    var idName: String {
        switch self {
            case .job: "job"
            case .education: "education"
            case .contact: "contact"
        }
    }
    
    var icon: String {
        switch self {
            case .job: "⌨️"
            case .education: "📚"
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
