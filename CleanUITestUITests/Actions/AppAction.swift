//
//  AppAction.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

protocol AppAction {
    var app: XCUIApplication { get }
    func tapButton(id: String, insideElement: XCUIElement?, waitUntilExists: Double, waitUntilHittable: Double, log: Log)
}

extension AppAction {
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    func tapButton(id: String, insideElement: XCUIElement? = nil, waitUntilExists: Double = 10, waitUntilHittable: Double = 10, log: Log = Log()) {
        
        let errrorDescription =  "button[\"\(id)\"] cannot be found"
        var button = self.app.buttons[id]
        
        if let insideElement = insideElement {
            expect(insideElement.exists, log: log).toEventually(beTrue(), timeout: waitUntilExists, description: errrorDescription)
            expect(insideElement.isHittable, log: log).toEventually(beTrue(), timeout: waitUntilHittable, description: errrorDescription)
            button = insideElement
        }
        
        expect(button.exists, log: log).toEventually(beTrue(), timeout: waitUntilExists, description: errrorDescription)
        expect(button.isHittable, log: log).toEventually(beTrue(), timeout: waitUntilHittable, description: errrorDescription)
        button.tap()
    }
}
