//
//  ModularizedByFeaturesUITests.swift
//  ModularizedByFeaturesUITests
//
//  Created by Ronaldo II Dorado on 22/5/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

class HomeScreen {
    init(file: String = #file, line: UInt = #line) {
         let showCatsButton = XCUIApplication().buttons["Show Cats1"]
         let showDogsButton = XCUIApplication().buttons["Show Dogs1"]
        
        expect(showCatsButton.exists, file: file, line: line).to(beTrue())
        expect(showDogsButton.exists, file: file, line: line).to(beTrue())
    }
}

class CatsListScreen {
    init() {
        expect(XCUIApplication().navigationBars["cats"].exists).to(beTrue())
    }
}

class CatFlowMessyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldViewAllCatsFromHomeTab() {
        _ = HomeScreen()
        
        let showCatsButton = XCUIApplication().buttons["Show Cats"]
        showCatsButton.tap()
   
        let cell = XCUIApplication().collectionViews.cells["cats1"]
        expect(cell.isHittable).toEventually(beTrue(), timeout:3)
        cell.tap()
        
        var navbar = XCUIApplication().navigationBars["cats1"]
        expect(navbar.exists).toEventually(beTrue())
        
        let image = XCUIApplication().images["imageView"]
        image.tap()
        navbar = XCUIApplication().navigationBars["cats2"]
        expect(navbar.exists).toEventually(beTrue())
        
        image.tap()
        navbar = XCUIApplication().navigationBars["cats3"]
        expect(navbar.exists).toEventually(beTrue())
        
        image.tap()
        navbar = XCUIApplication().navigationBars["cats4"]
        expect(navbar.exists).toEventually(beTrue())
        
        image.tap()
        navbar = XCUIApplication().navigationBars["cats5"]
        expect(navbar.exists).toEventually(beTrue())
    }
}

class Flow1UITests: UITestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    func testShouldNavigateToCatsTabFromHomeTab() {
        let showCatsButton = self.app.buttons["Show Cats"]
        expect(showCatsButton.exists).toEventually(beTrue())
        showCatsButton.tap()

        let catsNavbar = self.app.navigationBars["Cats"]
        expect(catsNavbar.exists).toEventually(beTrue())
        
    }
    override func tearDown() {
        super.tearDown()
    }
    
    
}

class Flow2UITests: UITestCase {
    override func shouldLaunchApplication() -> Bool {
        return false
    }
    
    func testShouldNavigateToDogsTabFromHomeTab() {
        super.applicationDidLaunch()
        
        let homeTab = XCUIApplication().tabBars.buttons["Home"]
        expect(homeTab.exists).toEventually(beTrue())
        homeTab.tap()
        
        let showDogsButton = self.app.buttons["Show Dogs"]
        expect(showDogsButton.exists).toEventually(beTrue())
        showDogsButton.tap()
        
        let dogsNavbar = self.app.navigationBars["Dogs"]
        expect(dogsNavbar.exists).toEventually(beTrue())
        
    }
}

class Flow3UITests: UITestCase {
    
    override func shouldLaunchApplication() -> Bool {
        return false
    }

    func testShouldNavigateToAllTabsFromTabBar() {
        let homeTab = XCUIApplication().tabBars.buttons["Home"]
        expect(homeTab.exists).toEventually(beTrue())
        homeTab.tap()
        
        let catsTab = XCUIApplication().tabBars.buttons["Cats"]
        expect(catsTab.exists).toEventually(beTrue())
        catsTab.tap()
        
        let catsNavbar = self.app.navigationBars["Cats"]
        expect(catsNavbar.exists).toEventually(beTrue())
        
        let dogsTab = XCUIApplication().tabBars.buttons["Dogs"]
        expect(dogsTab.exists).toEventually(beTrue())
        dogsTab.tap()
        
        let dogsNavbar = self.app.navigationBars["Dogs"]
        expect(dogsNavbar.exists).toEventually(beTrue())
    }
}
