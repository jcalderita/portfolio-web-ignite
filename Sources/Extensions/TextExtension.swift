//
//  File.swift
//  
//
//  Created by Jorge Calderita on 10/9/24.
//

import Ignite

extension Text {
    init(option: ProfileOption, uppercased: Bool = false) {
        let description = option.iconWithDescription(uppercased: uppercased)
        self.init(description)
    }
}
