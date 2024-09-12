//
//  File.swift
//  
//
//  Created by Jorge Calderita on 12/9/24.
//

import Foundation
import Ignite

func Tecnologies(_ tecnologies: [String]) -> Text {
    Text {
        for tecnology in tecnologies {
            Badge(tecnology)
                .role(.close)
                .style(
                    "background-color: \(Palette.accentOpacity.rawValue)"
                )
                .padding(.medium)
                .margin(.small)
        }
    }
}
