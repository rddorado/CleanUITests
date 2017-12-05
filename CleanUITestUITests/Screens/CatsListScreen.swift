//
//  CatsListScreen.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

public class Log {
    let file: String
    let line: UInt
    
    init(file: String = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }
}

class CatsListAppAction: AppAction {
    func tapAnyCell() {
        tapCell(id: "cats1")
    }
}

class CatsListScreen: ScreenProperties {
    
    var action = CatsListAppAction()
    
    init(log: Log = Log()) {
        let element = XCUIApplication().navigationBars["Cats"]
        expect(element.exists, log: log).to(beTrue(), description: screenNotFoundDescription)
    }
}

public func expect<T>(_ expression: @autoclosure @escaping () throws -> T?, log: Log) -> Expectation<T> {
    return expect(expression, file: log.file, line: log.line)
}
