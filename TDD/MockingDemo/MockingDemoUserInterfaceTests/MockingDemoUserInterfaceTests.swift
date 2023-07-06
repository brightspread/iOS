//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Leo on 2023/07/06.
//

import XCTest

class when_user_clicks_on_login_button: XCTestCase { //context!
    
    private var app: XCUIApplication! // ! 쓰는 이유 : app 초기화 안하면 테스트 다 fail
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_display_error_message_for_missing_required_fields() {
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    // UI테스트를 할때는 outside service에 독립적이어야함!
    // -> Mock object
    func test_should_navigate_to_dashboard_page_when_authenticated() {
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap() // 네트워크 콜, 네트워크에 따라 바뀔수있음!!
        
        let dashboardNavBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
    }
}
