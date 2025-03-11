import Foundation
import Ignite

struct ExperienceView: HTML {
    let option: ProfileOption
    let language: PortfolioLanguage
    let experiences: [Experience]
    
    init(_ option: ProfileOption, for language: PortfolioLanguage, experiences: [Experience]) {
        self.option = option
        self.language = language
        self.experiences = experiences
    }
    
    var body: some HTML {
        TitleView(option, language: language)
        
        ForEach(experiences) { xp in
            Table {
                Row {
                    Column {
                        Text(xp.title)
                            .font(.title6)
                            .fontWeight(.bold)
                            .style(.color, .primary)
                        Text(xp.role)
                            .style(.color, .primary)
                            .margin(.none)
                        Text {
                            xp.place.appending(" ")
                            Emphasis(xp.interval)
                        }
                        .style(.color, .primary)
                        .margin(.none)
                    }
                    .applyFirstStyle()
                }
                Row {
                    Column {
                        List { ForEach(xp.responsabilities) { xp in ListItem { "\(xp)"} } }
                            .style(.color, .primary)
                            .margin(.bottom, .none)
                    }
                    .applySecondStyle()
                }
                Row {
                    Column {
                        Tecnologies(xp.tecnologies)
                            .style(.color, .primary)
                            .margin(.vertical, -10)
                    }
                    .applyThirdStyle()
                }
            }
            .shadow(.accentColor, radius: 2)
        }
    }
}
