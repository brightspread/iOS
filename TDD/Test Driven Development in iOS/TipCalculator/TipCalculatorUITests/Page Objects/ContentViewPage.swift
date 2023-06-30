//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Leo on 2023/06/30.
//
// ui object 접근할때마다 이름으로 접근하고 있음 (textFields["totalTextField"])
// 나중에 문제 생길 가능성이 있음!
// pageObject pattern을 사용하자

import Foundation
import XCTest

class ContentViewPage {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var totalTextField: XCUIElement {
        app.textFields["totalTextField"]
    }
    
    var calculateTipButton: XCUIElement {
        app.buttons["calculateTipButton"]
    }
    
    var tipPercentageSegmentedControl: XCUIElement {
        app.segmentedControls["tipPercentageSegmentedControl"]
    }
    
    var tipText: XCUIElement {
        app.staticTexts["tipText"]
    }
    
    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }

}
