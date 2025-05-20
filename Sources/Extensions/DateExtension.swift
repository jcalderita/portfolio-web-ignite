import Foundation

extension Date {
    func formattedFor(language: PortfolioLanguage) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: language == .english ? "en_US" : "es_ES")
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
