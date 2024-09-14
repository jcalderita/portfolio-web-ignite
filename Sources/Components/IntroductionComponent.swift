import Foundation
import Ignite

struct IntroductionComponent: Component {
    let role: String
    let introduction: String
    
    func body(context: PublishingContext) -> [any PageElement] {
        Text(role)
            .font(.title2)
            .horizontalAlignment(.center)
            .foregroundStyle(.titleColor)
        Divider().foregroundStyle(.accentColor)
        Text(introduction)
            .font(.title6)
            .foregroundStyle(.primaryColor)
    }
}
