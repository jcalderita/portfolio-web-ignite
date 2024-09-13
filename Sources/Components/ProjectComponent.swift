//
//  File.swift
//  
//
//  Created by Jorge Calderita on 12/9/24.
//

import Foundation
import Ignite

struct ProjectComponent: Component {
    let option: ProfileOption
    let projects: [Project]
    
    init(_ option: ProfileOption, projects: [Project]) {
        self.option = option
        self.projects = projects
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
        Title(option)
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
