import Foundation
import Ignite

struct NavBar: Component {
    let name: String
    let language: PortfolioLanguage
    
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: logo) {
            for option in ProfileOption.allCases {
                Link(target: "#\(option.idName)") {
                    Text(option: option, for: language)
                        .margin(.none)
                        .foregroundStyle(.primaryColor)
                }
            }
            Link(target: language.page) {
                Text("\(language.flag) Version")
                    .margin(.none)
                    .foregroundStyle(.primaryColor)
            }
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .background(.secondaryColor)
        .position(.fixedTop)
    }
    
    private var logo: any InlineElement {
        Text(name)
            .fontWeight(.bold)
            .margin(.none)
            .font(.title4)
            .foregroundStyle(.primaryColor)
    }
}
