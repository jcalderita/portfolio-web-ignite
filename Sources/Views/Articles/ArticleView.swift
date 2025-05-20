import Foundation
import Ignite

struct ArticleView: ArticlePage {
    @Environment(\.decode) var decode
    
    var body: some HTML {
        if let portfolio {
            NavBarArticleView(language: language, title: article.title)                
            
            if let image = article.image {
                Text {
                    Image(image, description: article.imageDescription)
                        .resizable()
                        .cornerRadius(20)
                        .frame(maxHeight: 300)
                }
                .frame(alignment: .center)
                .margin(.top, 80)
            }

            Text(article.text)
            
            FooterView(links: portfolio.links)
            FooterIgniteView(footer: portfolio.footer)
        }
    }
    
    var language: PortfolioLanguage {
        .init("\(article.metadata["language"] ?? "")")
    }
    
    var portfolio: Profile? {
        decode.callAsFunction("\(language.rawValue).json", as: Profile.self)
    }
}
