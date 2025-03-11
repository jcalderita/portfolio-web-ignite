import Foundation
import Ignite

struct En: StaticPage {
    let title: String
    
    init() {
        self.title = "Jcalderita"
    }
    
    var body: some HTML {
        Portfolio()
    }
}
