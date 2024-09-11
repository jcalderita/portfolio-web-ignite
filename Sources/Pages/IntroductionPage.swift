//
//  File.swift
//  
//
//  Created by Jorge Calderita on 10/9/24.
//

import Foundation
import Ignite

struct IntroductionPage: Component {
    let role: String
    let introduction: String
    
    func body(context: PublishingContext) -> [any PageElement] {
        Text("I'm a \(role)")
            .font(.title2)
            .horizontalAlignment(.center)
            .foregroundStyle(.primaryColor)
        Divider().foregroundStyle(.accentColor)
        Text(introduction)
            .font(.title6)
            .foregroundStyle(.primaryColor)
        Spacer()
    }
}
