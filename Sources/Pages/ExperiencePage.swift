//
//  File.swift
//  
//
//  Created by Jorge Calderita on 11/9/24.
//

import Foundation
import Ignite

struct ExperiencePage: Component {
    let option: ProfileOption
    let experiences: [Experience]
    
    init(_ option: ProfileOption, experiences: [Experience]) {
        self.option = option
        self.experiences = experiences
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
        Title(option)
        experiences.map { xp in
            Table {
                Row {
                    Column {
                        Text(xp.title)
                            .font(.title6)
                            .fontWeight(.bold)
                            .foregroundStyle(.primaryColor)
                        Text(xp.role)
                            .foregroundStyle(.primaryColor)
                            .margin(.none)
                        Text {
                            xp.place.appending(" ")
                            Emphasis(xp.interval)
                        }
                        .foregroundStyle(.primaryColor)
                        .margin(.none)
                    }
                    .applyFirstStyle()
                }
                Row {
                    Column {
                        List { for responsability in xp.responsabilities { "\(responsability)" } }
                            .foregroundStyle(.primaryColor)
                            .margin(.bottom, .none)
                    }
                    .applySecondStyle()
                }
                Row {
                    Column {
                        Tecnologies(xp.tecnologies)
                            .foregroundStyle(.primaryColor)
                            .margin(.vertical, -10)
                    }
                    .applyThirdStyle()
                }
            }
            .shadow(.accentColor, radius: 2)
        }
    }
}
