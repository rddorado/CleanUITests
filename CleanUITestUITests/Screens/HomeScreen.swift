//
//  HomeScreen.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble


class HomeScreenAppAction: AppAction {
}

class HomeScreenAction: ScreenAction {
    typealias AppActionType = HomeScreenAppAction
    var appAction:HomeScreenAppAction = HomeScreenAppAction()
    
    func tapShowCatsButton(file: String = #file, line: UInt = #line) {
        appAction.tapButton(id: "Show Cats", file: file, line: line)
    }
}

class HomeScreen: ScreenProperties {
    
    var action = HomeScreenAction()

    init(file: String = #file, line: UInt = #line) {
        let showCatsButton = XCUIApplication().buttons["Show Cats"]
        let showDogsButton = XCUIApplication().buttons["Show Dogs"]
   
        expect(showCatsButton.exists, file: file, line: line).to(beTrue(), description: screenNotFoundDescription)
        expect(showDogsButton.exists, file: file, line: line).to(beTrue(), description: screenNotFoundDescription)
    }
}


