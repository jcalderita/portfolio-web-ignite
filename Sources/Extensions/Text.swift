//
//  File.swift
//  
//
//  Created by Jorge Calderita on 10/9/24.
//

import Ignite


extension Text {
    init(type: TypeOfExperience, uppercased: Bool = false) {
        let description = type.iconWithDescription(uppercased: uppercased)
        self.init(description)
    }
}
