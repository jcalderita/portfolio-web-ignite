import Foundation
import Ignite

struct NavBarArticleView: HTML {
    @Environment(\.articles) var articles
    
    let language: PortfolioLanguage
    let title: String?
    let all: Bool
    
    init(language: PortfolioLanguage, title: String? = nil, all: Bool = false) {
        self.language = language
        self.title = title
        self.all = all
    }
    
    var body: some HTML {
        NavigationBar(logo: logo) {
            if all {
                Link(span, target: allArticlesView)
            } else {
                Link(articlesLink, target: allArticlesView)
                Link(span, target: languageArticle.path)
            }
        }
        .applyStyle()
    }
    
    private var languageArticle: Article {
        let language = switch language {
            case .english: PortfolioLanguage.spanish.rawValue
            case .spanish: PortfolioLanguage.english.rawValue
        }
        
        guard let title, let article = articles.typed(language).first(where: { $0.title == title }) else {
            fatalError("No article found")
        }
        
        return article
    }
    
    private var articlesLink: some InlineElement {
        Span(option: ProfileOption.articles, for: language)
        .style(.color, .primary)
        .margin(.none)
    }
    
    private var allArticlesView: any StaticPage {
        if all {
            language == .spanish ? EnArticles() : EsArticles()
        } else {
            language == .english ? EnArticles() : EsArticles()
        }
    }
    
    private var span: some InlineElement {
        Span("\(language.flag)")
            .style(.color, .primary)
            .margin(.none)
    }
}
