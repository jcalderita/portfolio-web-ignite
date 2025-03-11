import Foundation
import Ignite

struct ProjectView: HTML {
    let option: ProfileOption
    let language: PortfolioLanguage
    let projects: [Project]
    
    init(_ option: ProfileOption, for language: PortfolioLanguage, projects: [Project]) {
        self.option = option
        self.language = language
        self.projects = projects
    }
    
    var body: some HTML {
        TitleView(option, language: language)
        
        Grid {
            ForEach(projects) { project in
                Table {
                    Row {
                        Column {
                            Text(project.name)
                                .font(.title6)
                                .fontWeight(.bold)
                                .style(.color, .primary)
                        }
                        .applyFirstStyle()
                    }
                    Row {
                        Column {
                            Text(markdown: project.description)
                                .style(.color, .primary)
                                .margin(.none)
                        }
                        .applySecondStyle()
                    }
                    Row {
                        Column {
                            Links(project.links)
                                .horizontalAlignment(.center)
                                .font(.title4)
                                .margin(.bottom, .none)
                        }
                        .applyThirdStyle()
                    }
                }
                .shadow(.accentColor, radius: 2)
            }
        }
        .columns(3)
    }
}
