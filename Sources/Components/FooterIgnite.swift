//
//  File.swift
//  
//
//  Created by Jorge Calderita on 12/9/24.
//

import Foundation
import Ignite

struct FooterIgnite: Component {

    func body(context: PublishingContext) -> [any PageElement] {
        Text {
            Link("Created with Ignite and Swift.", target: URL("https://github.com/twostraws/Ignite"))
                .class("text-decoration-none")
                .style("color: \(Palette.primary.rawValue)")
        }
        .fontWeight(.bold)
        .horizontalAlignment(.center)
    }
}
