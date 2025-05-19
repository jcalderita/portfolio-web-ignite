import Foundation
import Ignite

struct ArticlesView: HTML {
    @Environment(\.articles) var articles
    let option: ProfileOption
    let language: PortfolioLanguage
    
    init(_ option: ProfileOption, for language: PortfolioLanguage) {
        self.option = option
        self.language = language
    }
    
    var body: some HTML {
        TitleView(option, language: language)
        
        List {
            ForEach(articles.all) { article in
//                Text(article.title)
                Link(article)
            }
        }

    }
}
