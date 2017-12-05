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
    func tapShowCatsButton(log: Log = Log()) {
        self.tapButton(id: "Show Cats", log: log)
    }
}

class HomeScreen: ScreenProperties {
    
    var action = HomeScreenAppAction()

    init(log: Log = Log()) {
        let showCatsButton = XCUIApplication().buttons["Show Cats"]
        let showDogsButton = XCUIApplication().buttons["Show Dogs"]
   
        expect(showCatsButton.exists, log: log).to(beTrue(), description: screenNotFoundDescription)
        expect(showDogsButton.exists, log: log).to(beTrue(), description: screenNotFoundDescription)
    }
}


