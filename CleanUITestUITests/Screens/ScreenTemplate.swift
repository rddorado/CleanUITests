//
//  ScreenTemplate.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

class _TemplateName_AppAction: AppAction {
}

class _TemplateName_Screen: ScreenProperties {
    
    var action = _TemplateName_AppAction()
    
    init(file: String = #file, line: UInt = #line) {
        let element = XCUIApplication().otherElements.allElementsBoundByIndex[0] // TODO: replace this
        expect(element.exists, file: file, line: line).to(beTrue(), description: screenNotFoundDescription)
    }
}
