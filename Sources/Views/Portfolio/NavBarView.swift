import Foundation
import Ignite

struct NavBarView: HTML {
    let language: PortfolioLanguage
    
    init(language: PortfolioLanguage) {
        self.language = language
    }
    
    var body: some HTML {
        NavigationBar(logo: logo) {
            for option in ProfileOption.allCases {
                Link(target: "#\(option.idName)") {
                    Span(option: option, for: language)
                        .style(.color, .primary)
                        .margin(.none)
                }
            }
            Link(target: language.page) {
                Span("\(language.flag)")
                    .style(.color, .primary)
                    .margin(.none)
            }
        }
        .applyStyle()
    }
}
