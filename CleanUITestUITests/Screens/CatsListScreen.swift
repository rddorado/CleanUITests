//
//  CatsListScreen.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

public struct Log {
    let file: String
    let line: UInt
    
    init(file: String = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }
}

class CatsListAppAction: AppAction {
    
    // TODO: Move this AppAction?
    func tapCell(id: String, waitUntilExists: Double = 10 , waitUntilHittable: Double = 10, log: Log = Log()) {
        let errrorDescription =  "cell[\"\(id)\"] cannot be found"
        let cell = XCUIApplication().collectionViews.cells[id]
        expect(cell.exists, log: log).toEventually(beTrue(), timeout:3, description: errrorDescription)
        cell.tap()
    }
}

class CatsListScreenAction: ScreenAction {
    typealias AppActionType = CatsListAppAction
    var appAction:CatsListAppAction = CatsListAppAction()
    
    func tapCell(id: String = "cats1", log: Log = Log()) {
        appAction.tapCell(id: id, log: log)
    }
}

class CatsListScreen: ScreenProperties {
    
    var action = CatsListScreenAction()
    
    init(file: String = #file, line: UInt = #line) {
        let element = XCUIApplication().navigationBars["Cats"]
        expect(element.exists, file: file, line: line).to(beTrue(), description: screenNotFoundDescription)
    }
}

public func expect<T>(_ expression: @autoclosure @escaping () throws -> T?, log: Log) -> Expectation<T> {
    
    return expect(expression, file: log.file, line: log.line)
//    return Expectation(
//        expression: Expression(
//            expression: expression,
//            location: SourceLocation(file: log.file, line: log.line),
//            isClosure: true))
}
