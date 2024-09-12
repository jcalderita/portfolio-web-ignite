//
//  File.swift
//  
//
//  Created by Jorge Calderita on 9/9/24.
//

import Foundation
import Ignite

struct NavBar: Component {
    let name: String
    
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: logo) {
            Link(target: "#\(ProfileOption.job.idName)") {
                Text(type: .job)
                    .margin(0)
                    .foregroundStyle(.primaryColor)
            }
            Link(target: "#\(ProfileOption.education.idName)") {
                Text(type: .education)
                    .margin(0)
                    .foregroundStyle(.primaryColor)
            }
            Link(target: "#\(ProfileOption.contact.idName)") {
                Text(type: .contact)
                    .margin(0)
                    .foregroundStyle(.primaryColor)
            }
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .background(.secondaryColor)
        .position(.fixedTop)
    }
    
    private var logo: any InlineElement {
        Text(name)
            .fontWeight(.bold)
            .margin(0)
            .font(.title4)
            .foregroundStyle(.primaryColor)
    }
}
