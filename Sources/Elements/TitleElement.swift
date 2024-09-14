import Foundation
import Ignite

func Title(_ option: ProfileOption, for language: PortfolioLanguage) -> PageElement {
    Text(option: option, for: language, uppercased: true)
        .font(.title2)
        .foregroundStyle(.titleColor)
        .id(option.idName)
        .margin(.vertical)
}
