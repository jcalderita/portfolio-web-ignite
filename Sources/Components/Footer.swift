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
        Links(links)
            .margin(.top, .extraLarge)
            .margin(.bottom, .large)
            .font(.title4)
            .horizontalAlignment(.center)
            .id(ProfileOption.contact.idName)
    }
}
