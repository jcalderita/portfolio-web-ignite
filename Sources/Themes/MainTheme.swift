import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        return HTML {
            Head(for: page, in: context)
            Body {
                page.body
            }
            .padding(.top, 80)
            .class("container")
            .style("background-color: \(Palette.background.rawValue)")
        }
    }
}
