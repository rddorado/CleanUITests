//___FILEHEADER___

import XCTest
import Nimble

class ___VARIABLE_productName___AppAction: AppAction {
    func tapAnyItem() {
        // Sample Action
    }
}

class ___VARIABLE_productName___Screen: ScreenProperties {
    
    var action = ___VARIABLE_productName___AppAction()
    
    init(log: Log = Log()) {
        let element = XCUIApplication().navigationBars[<NavigationBar Title >]
        expect(element.exists, log: log).to(beTrue(), description: screenNotFoundDescription)
    }
}
