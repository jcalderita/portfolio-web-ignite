import Foundation
import Ignite

func portfolio(context: PublishingContext, for language: PortfolioLanguage) -> Group {
    let portfolio = context.decode(resource: "\(language.rawValue).json", as: Profile.self)
    
    return Group {
        if let portfolio {
            NavBar(name: portfolio.name, language: language)
            IntroductionComponent(role: portfolio.role, introduction: portfolio.introduction)
            ExperienceComponent(.job, for: language, experiences: portfolio.jobs)
            ExperienceComponent(.education, for: language, experiences: portfolio.education)
            ProjectComponent(.project, for: language, projects: portfolio.projects)
            Footer(links: portfolio.links)
            FooterIgnite(footer: portfolio.footer)
        }
    }
}
