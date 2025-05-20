import Foundation
import Ignite

struct EnArticles: StaticPage {
    let title: String
    
    init() {
        self.title = "Jcalderita"
    }
    
    var body: some HTML {
        AllArticlesView(for: .english)
    }
}
