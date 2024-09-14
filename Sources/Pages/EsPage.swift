import Foundation
import Ignite

struct Es: StaticPage {
    var title = "Jcalderita"

    func body(context: PublishingContext) -> [BlockElement] {
        portfolio(context: context, for: .spanish)
    }
}
