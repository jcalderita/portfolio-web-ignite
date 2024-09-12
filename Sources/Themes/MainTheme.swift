import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        let portfolio = context.decode(resource: "English.json", as: Profile.self)
        return HTML {
            Head(for: page, in: context)

            Body {
                if let portfolio {
                    NavBar(name: portfolio.name)
                    IntroductionPage(role: portfolio.role, introduction: portfolio.introduction)
                    ExperiencePage(.job, experiences: portfolio.jobs)
                    ExperiencePage(.education, experiences: portfolio.education)
                    ProjectPage(.project, projects: portfolio.projects)
                    Footer(links: portfolio.links)
                    FooterIgnite()
                } else {
                    page.body
                }
            }
            .padding(.top, 80)
            .class("container")
            .style("background-color: \(Palette.background.rawValue)")
        }
    }
}
