import Foundation
import Ignite

struct FooterIgniteView: HTML {
    let footer: String
    let target: URL
    
    init(footer: String) {
        self.footer = footer
        guard let url = URL(string: "https://github.com/twostraws/Ignite") else {
            fatalError("Not a valid URL")
        }
        self.target = url
    }
    
    var body: some HTML {
        Text {
            Link(footer, target: target)
                .class("text-decoration-none")
                .style(.color, .primary)
        }
        .horizontalAlignment(.center)
        .fontWeight(.bold)
    }
}
