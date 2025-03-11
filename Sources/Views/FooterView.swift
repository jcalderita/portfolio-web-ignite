import Foundation
import Ignite

struct FooterView: HTML {
    let links: [SocialLink]
    
    var body: some HTML {
        Text {
            ForEach(links) { link in
                Link(target: link.link) {
                    Image(systemName: link.icon)
                }
                .relationship(.noOpener, .noReferrer)
                .class("text-decoration-none")
                .style(.color, .primary)
                .margin(.horizontal, 10)
            }
        }
        .horizontalAlignment(.center)
        .font(.title4)
        .margin(.top, .xLarge)
        .margin(.bottom, .large)
        .id(ProfileOption.contact.idName)
    }
}
