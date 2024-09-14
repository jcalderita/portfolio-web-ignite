import Foundation
import Ignite

struct En: StaticPage {
    var title = "Jcalderita"

    func body(context: PublishingContext) -> [BlockElement] {
        portfolio(context: context, for: .english)
    }
}
