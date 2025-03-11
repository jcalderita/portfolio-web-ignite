import Foundation
import Ignite

struct NavBarView: HTML {
    let name: String
    let language: PortfolioLanguage
    
    var body: some HTML {
        NavigationBar(logo: logo) {
            for option in ProfileOption.allCases {
                Link(target: "#\(option.idName)") {
                    Text(option: option, for: language)
                        .style(.color, .primary)
                        .margin(.none)
                }
            }
            Link(target: language.page) {
                Text("\(language.flag) Version")
                    .style(.color, .primary)
                    .margin(.none)
            }
        }
        .width(.viewport)
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .background(.secondaryColor)
        .position(.fixedTop)
    }
    
    private var logo: some InlineElement {
        Text(name)
            .font(.title4)
            .fontWeight(.bold)
            .style(.color, .primary)
            .margin(.none)
    }
}
