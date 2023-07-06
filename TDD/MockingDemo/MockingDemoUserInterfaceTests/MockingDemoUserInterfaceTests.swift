//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Leo on 2023/07/06.
//

import XCTest

class when_user_clicks_on_login_button: XCTestCase { //context!
    
    private var app: XCUIApplication! // ! 쓰는 이유 : app 초기화 안하면 테스트 다 fail
    
    private var loginPageObject: LoginPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        loginPageObject = LoginPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"] // 런치 상태를 TEST 상태로 지정
        app.launch()
    }
    
    func test_should_display_error_message_for_missing_required_fields() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func test_should_display_error_message_for_invalid_credentials() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("WrongPassword")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap() // 네트워크 콜, 네트워크에 따라 바뀔수있음!!

        let messageText = loginPageObject.messageText
        XCTAssertEqual(messageText.label, "Invalid credentials")
    }
    
    // UI테스트를 할때는 outside service에 독립적이어야함!
    // -> Mock object
    func test_should_navigate_to_dashboard_page_when_authenticated() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap() // 네트워크 콜, 네트워크에 따라 바뀔수있음!!
        
        let dashboardNavBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
    }
}
