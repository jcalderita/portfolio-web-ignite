import Foundation
import Ignite

struct FooterIgnite: Component {
    let footer: String

    func body(context: PublishingContext) -> [any PageElement] {
        Text {
            Link(footer, target: URL("https://github.com/twostraws/Ignite"))
                .class("text-decoration-none")
                .style("color: \(Palette.primary.rawValue)")
        }
        .fontWeight(.bold)
        .horizontalAlignment(.center)
    }
}
