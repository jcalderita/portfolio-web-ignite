import Foundation
import Ignite

@MainActor
func Links(_ links: [SocialLink]) -> Text {
    Text {
        ForEach(links) { link in
            Link(target: link.link) {
                Image(systemName: link.icon, description: link.description)
                    .style(.color, .primary)
            }
            .margin()
        }
    }
}
