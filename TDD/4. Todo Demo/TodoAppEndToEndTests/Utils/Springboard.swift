//
//  Springboard.swift
//  TodoAppEndToEndTests
//
//  Created by Leo on 2023/07/06.
//

import Foundation
import XCTest

class Springboard {

    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    class func deleteApp() {
        XCUIApplication().terminate()
        springboard.activate()
        
        let appIcon = springboard.icons.matching(identifier: "TodoApp").firstMatch // 앱 이름
        appIcon.press(forDuration: 1.3) // 롱프레스
        
        let _ = springboard.buttons["앱 제거"].waitForExistence(timeout: 1.0)
        springboard.buttons["앱 제거"].tap()
        
        let deleteButton = springboard.alerts.buttons["앱 삭제"].firstMatch
        if deleteButton.waitForExistence(timeout: 5) {
            deleteButton.tap()
            springboard.alerts.buttons["삭제"].tap()
        }
        
        
    }
}
