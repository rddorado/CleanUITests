//
//  UITestCase.swift
//  ModularizedByFeaturesUITests
//
//  Created by Ronaldo II Dorado on 20/10/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest

class UITestCase: XCTestCase {
    
    var  app : XCUIApplication {
        return XCUIApplication()
    }
    override func setUp() {
        super.setUp()
        
        setupBeforeEachTest()

        if shouldContinueAfterFailure() {
            continueAfterFailure = false
        }
        
        if shouldLaunchApplication() {
            applicationWillLaunch()
        }
        
        applicationDidLaunch()

    }
    
    override func tearDown() {
        print(" --- tearDown")
        super.tearDown()
    }
    
    override class func tearDown() {
        print(" --- class func tearDown(")
    }
    
 
    class func setup() {
        print(" --- class func setup()")
    }
    
    func shouldContinueAfterFailure() -> Bool {
        print(" --- shouldContinueAfterFailure")
        return false
    }
    
    func shouldLaunchApplication() -> Bool {
        print(" --- shouldLaunchApplication")
        return true
    }
    
    func setupBeforeEachTest() {
        print(" --- setupBeforeEachTest")
    }
    
    func applicationWillLaunch() {
        print(" --- applicationWillLaunch")
        XCUIApplication().launch()
    }
    
    func applicationDidLaunch() {
        print(" --- applicationDidLaunch")
    }
    
}
