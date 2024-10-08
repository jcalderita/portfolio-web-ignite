import Foundation
import Ignite

func Links(_ links: [SocialLink]) -> Text {
    Text {
        for link in links {
            Link(target: link.link) {
                Image(systemName: link.icon, description: link.description)
                    .foregroundStyle(.primaryColor)
            }
            .margin()
            .linkStyle(.hover)
        }
    }
}
