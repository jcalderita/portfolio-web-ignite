import Foundation
import Ignite

struct AllArticlesView: HTML {
    @Environment(\.articles) var articles
    @Environment(\.decode) var decode
    
    let language: PortfolioLanguage
    
    init(for language: PortfolioLanguage) {
        self.language = language
    }
    
    var body: some HTML {
        if let portfolio {
            NavBarArticleView(language: language, all: true)
            
            Grid {
                ForEach(articles.typed(language.rawValue)) { article in
                    Card {
                        if let image = article.image,
                           let description = article.metadata["description"] {
                            VStack(alignment: .center) {
                                Link(target: article.path) {
                                    Image(image, description: article.imageDescription)
                                        .resizable()
                                        .cornerRadius(20)
                                        .frame(maxHeight: 150)
                                }
                                
                                Spacer()
                                
                                Text("\(description)")
                                    .margin(.top)
                            }
                        }
                    } header: {
                        HStack {
                            Span("\(article.title)")
                                .font(.title5)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Span(article.date.formattedFor(language: language))
                                .font(.title6)
                        }
                    } footer: {
                        if let tags = article.tags {
                            ForEach(tags) { tag in
                                Badge(tag)
                                    .role(.light)
                                    .margin(.trailing)
                            }
                        }
                    }
                    .cardStyle(.bordered)
                }
            }
            .columns(3)
            .margin(.top, 80)
            
            FooterView(links: portfolio.links)
            FooterIgniteView(footer: portfolio.footer)
        }
    }
    
    private var portfolio: Profile? {
        decode.callAsFunction("\(language.rawValue).json", as: Profile.self)
    }
}
