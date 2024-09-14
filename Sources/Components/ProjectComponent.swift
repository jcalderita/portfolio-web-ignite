import Foundation
import Ignite

struct ProjectComponent: Component {
    let option: ProfileOption
    let language: PortfolioLanguage
    let projects: [Project]
    
    init(_ option: ProfileOption, for language: PortfolioLanguage, projects: [Project]) {
        self.option = option
        self.language = language
        self.projects = projects
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
        Title(option, for: language)
        Section {
            projects.map { project in
                Table {
                    Row {
                        Column {
                            Text(project.name)
                                .font(.title6)
                                .fontWeight(.bold)
                                .foregroundStyle(.primaryColor)
                        }
                        .applyFirstStyle()
                    }
                    Row {
                        Column {
                            Text(markdown: project.description)
                                .foregroundStyle(.primaryColor)
                                .margin(.none)
                        }
                        .applySecondStyle()
                    }
                    Row {
                        Column {
                            Links(project.links)
                                .font(.title4)
                                .horizontalAlignment(.center)
                                .margin(.bottom, .none)
                        }
                        .applyThirdStyle()
                    }
                }
                .shadow(.accentColor, radius: 2)
            }
        }
        .columns(4)
    }
}
