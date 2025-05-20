import Foundation
import Ignite

struct ArticlesView: HTML {
    @Environment(\.articles) var articles
    let language: PortfolioLanguage
    
    init(for language: PortfolioLanguage) {
        self.language = language
    }
    
    var body: some HTML {
        TitleView(.articles, language: language)
        
        List {
            ForEach(articles.typed(language.rawValue).prefix(5)) { article in
                if let image = article.image {
                    Link(target: article.path) {
                        Image(image, description: article.imageDescription)
                            .resizable()
                            .cornerRadius(20)
                            .frame(maxHeight: 150)
                            .margin(.trailing)
                    }
                }
            }
        }.horizontalAlignment(.leading)
    }
}
