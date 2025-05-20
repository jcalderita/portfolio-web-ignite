import Foundation
import Ignite

struct TitleView: HTML {
    let option: ProfileOption
    let language: PortfolioLanguage
    
    init(_ option: ProfileOption, language: PortfolioLanguage) {
        self.option = option
        self.language = language
    }
    
    var body: some HTML {
        Text(option: option, for: language, uppercased: true)
            .font(.title2)
            .style(.color, .titleColor)
            .margin(.vertical)
            .id(option.idName)
    }
}
