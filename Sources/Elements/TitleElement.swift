//
//  File.swift
//  
//
//  Created by Jorge Calderita on 12/9/24.
//

import Foundation
import Ignite

func Title(_ option: ProfileOption) -> PageElement {
    Text(option: option, uppercased: true)
        .font(.title2)
        .foregroundStyle(.titleColor)
        .id(option.idName)
        .margin(.vertical)
}
