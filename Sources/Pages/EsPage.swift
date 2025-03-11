import Foundation
import Ignite

struct Es: StaticPage {
    let title: String
    
    init() {
        self.title = "Jcalderita"
    }
    
    var body: some HTML {
        Portfolio(for: .spanish)
    }
}
