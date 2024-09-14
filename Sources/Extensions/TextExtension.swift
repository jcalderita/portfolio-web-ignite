import Ignite

extension Text {
    init(option: ProfileOption, for language: PortfolioLanguage, uppercased: Bool = false) {
        let description = option.iconWithDescription(for: language, uppercased: uppercased)
        self.init(description)
    }
}
