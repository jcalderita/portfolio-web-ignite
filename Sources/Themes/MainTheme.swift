import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        let profile = context.decode(resource: "English.json", as: Profile.self)
        return HTML {
            Head(for: page, in: context)

            Body {
                if let profile {
                    NavBar(name: profile.name)
                    IntroductionPage(role: profile.role, introduction: profile.introduction)
                    ExperiencePage(.job, experiences: profile.jobs)
                    ExperiencePage(.education, experiences: profile.education)
                    Footer(links: profile.links)
                    IgniteFooter()
                } else {
                    page.body
                }
            }
            .padding(.vertical, 80)
            .class("container")
            .style("background-color: \(Palette.background.rawValue)")
        }
    }
}
