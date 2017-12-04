//
//  ScreenProperties.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import Foundation

protocol ScreenProperties {
    var screenNotFoundDescription: String { get }
}

extension ScreenProperties {
    var screenNotFoundDescription: String {
        return "\(self) is not found."
    }
}
