//
//  CatsListScreen.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

class CatsListAppAction: AppAction {
    // TODO: Move this AppAction?
    func tapCell(id: String, file: String = #file, line: UInt = #line) {
        let errrorDescription =  "cell[\"\(id)\"] cannot be found"
        let cell = XCUIApplication().collectionViews.cells[id]
        expect(cell.exists, file: file, line: line).toEventually(beTrue(), timeout:3, description: errrorDescription)
        cell.tap()
    }
}

class CatsListScreenAction: ScreenAction {
    typealias AppActionType = CatsListAppAction
    var appAction:CatsListAppAction = CatsListAppAction()
    
    func tapCell(id: String = "cats1", file: String = #file, line: UInt = #line) {
        appAction.tapCell(id: id, file: file, line: line)
    }
}

class CatsListScreen: ScreenProperties {
    
    var action = CatsListScreenAction()
    
    init(file: String = #file, line: UInt = #line) {
        let element = XCUIApplication().navigationBars["Cats"]
        expect(element.exists, file: file, line: line).to(beTrue(), description: screenNotFoundDescription)
    }
}
