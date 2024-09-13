import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Jcalderita"

    func body(context: PublishingContext) -> [BlockElement] {
        let portfolio = context.decode(resource: "English.json", as: Profile.self)
        if let portfolio {
            Group {
                NavBar(name: portfolio.name)
                IntroductionComponent(role: portfolio.role, introduction: portfolio.introduction)
                ExperienceComponent(.job, experiences: portfolio.jobs)
                ExperienceComponent(.education, experiences: portfolio.education)
                ProjectComponent(.project, projects: portfolio.projects)
                Footer(links: portfolio.links)
                FooterIgnite()
            }
        }
    }
}
