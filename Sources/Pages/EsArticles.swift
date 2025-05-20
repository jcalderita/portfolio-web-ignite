import Foundation
import Ignite

struct EsArticles: StaticPage {
    let title: String
    
    init() {
        self.title = "Jcalderita"
    }
    
    var body: some HTML {
        AllArticlesView(for: .spanish)
    }
}
