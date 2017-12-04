//
//  ModularizedByFeaturesUITests.swift
//  ModularizedByFeaturesUITests
//
//  Created by Ronaldo II Dorado on 22/5/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

class CatFlowMessyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldViewAllCatsFromHomeTab() {
  
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
