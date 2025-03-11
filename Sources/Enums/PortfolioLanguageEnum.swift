import Foundation
import Ignite

enum PortfolioLanguage: String {
    case english = "English"
    case spanish = "Spanish"
    
    var flag: String {
        switch self {
            case .english: "🇪🇸"
            case .spanish: "🇺🇸"
        }
    }
    
    var page: String {
        switch self {
            case .english: "/es"
            case .spanish: "/en"
        }
    }
}
