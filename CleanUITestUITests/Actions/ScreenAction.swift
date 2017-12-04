//
//  ScreenAction.swift
//  CleanUITestUITests
//
//  Created by Ronaldo II Dorado on 4/12/17.
//  Copyright © 2017 Ronaldo II Dorado. All rights reserved.
//

import XCTest
import Nimble

protocol ScreenAction {
    associatedtype AppActionType
    var appAction: AppActionType { get set }
}

extension ScreenAction {
}
