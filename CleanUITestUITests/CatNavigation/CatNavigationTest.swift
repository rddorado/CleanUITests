//
//  CatNavigationTest.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

class CatNavigationTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testShouldViewAllCatsFromHomeTab() {
        let homeScreen = HomeScreen()
        homeScreen.action.tapShowCatsButton()
        
        let catsListScreen = CatsListScreen()
        catsListScreen.action.tapCell()
        
        
//        let showCatsButton = XCUIApplication().buttons["Show Cats"]
//        showCatsButton.tap()
//        
//        let cell = XCUIApplication().collectionViews.cells["cats1"]
//        expect(cell.isHittable).toEventually(beTrue(), timeout:3)
//        cell.tap()
//        
//        var navbar = XCUIApplication().navigationBars["cats1"]
//        expect(navbar.exists).toEventually(beTrue())
//        
//        let image = XCUIApplication().images["imageView"]
//        image.tap()
//        navbar = XCUIApplication().navigationBars["cats2"]
//        expect(navbar.exists).toEventually(beTrue())
//        
//        image.tap()
//        navbar = XCUIApplication().navigationBars["cats3"]
//        expect(navbar.exists).toEventually(beTrue())
//        
//        image.tap()
//        navbar = XCUIApplication().navigationBars["cats4"]
//        expect(navbar.exists).toEventually(beTrue())
//        
//        image.tap()
//        navbar = XCUIApplication().navigationBars["cats5"]
//        expect(navbar.exists).toEventually(beTrue())
    }
    
}
