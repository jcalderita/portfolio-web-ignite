//
//  File.swift
//  
//
//  Created by Jorge Calderita on 11/9/24.
//
import Foundation
import Ignite

struct Footer: Component {
    let links: [SocialLink]
    
    func body(context: PublishingContext) -> [any PageElement] {
        Text {
            for link in links {
                Link(target: link.link) {
                    Image(systemName: link.icon, description: link.description)
                        .margin()
                        .foregroundStyle(.primaryColor)
                }
                .linkStyle(.hover)
            }
        }
        .margin(.top, .extraLarge)
        .font(.title4)
        .horizontalAlignment(.center)
        .id(ProfileOption.contact.idName)
    }
}
