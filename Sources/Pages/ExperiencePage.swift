//
//  File.swift
//  
//
//  Created by Jorge Calderita on 11/9/24.
//

import Foundation
import Ignite

struct ExperiencePage: Component {
    let type: TypeOfExperience
    let experiences: [Experience]
    
    init(_ type: TypeOfExperience, experiences: [Experience]) {
        self.type = type
        self.experiences = experiences
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
        Title()
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
                        Text("Link")
                            .foregroundStyle(.primaryColor)
                    }
                    .applyThirdStyle()
                }
            }
            .shadow(.accentColor, radius: 2)
        }
    }
    
    private func Title() -> PageElement {
        Text(type: type, uppercased: true)
            .font(.title2)
            .foregroundStyle(.titleColor)
            .id(type.idName)
            .margin(.vertical)
    }
    
}
