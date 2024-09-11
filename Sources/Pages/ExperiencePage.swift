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
        Text(type: type, uppercased: true)
            .font(.title2)
            .foregroundStyle(.primaryColor)
            .id(type.idName)
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
                    .style(
                        "background-color: \(Palette.secondary.rawValue)",
                        "border-color: \(Palette.accentOpacity.rawValue)")
                    .padding()
                }
                Row {
                    Column {
                        List { for responsability in xp.responsabilities { "\(responsability)" } }
                            .foregroundStyle(.primaryColor)
                            .margin(.bottom, .none)
                    }
                    .style(
                        "background-color: \(Palette.background.rawValue)",
                        "border-color: \(Palette.accentOpacity.rawValue)")
                    .padding()
                }
                Row {
                    Column {
                        Text("Link")
                            .foregroundStyle(.primaryColor)
                    }
                    .style(
                        "background-color: \(Palette.secondary.rawValue)",
                        "border-bottom-width: 0")
                    .padding()
                }
            }
            .shadow(.accentColor, radius: 2)
        }
    }
}
