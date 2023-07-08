//
//  QuizAppUserInterfaceTests.swift
//  QuizAppUserInterfaceTests
//
//  Created by Leo on 2023/07/07.
//

import XCTest

final class when_app_is_launched: XCTestCase {
    
    func test_should_display_available_quizzes() {
        
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        
        let _ = app.tables["quizList"].waitForExistence(timeout: 5.0)
        let quizList = app.collectionViews["quizList"]
        
        XCTAssertEqual(2, quizList.cells.count)
    }
}

final class when_user_taps_on_a_quiz: XCTestCase {
    
    func test_should_display_questions_for_the_selected_quiz() {
        
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        
        let quizList = app.collectionViews["quizList"]
        quizList.cells.element(boundBy: 0).staticTexts["Math 101"].tap()
        
        let _ = app.collectionViews["questionList"].waitForExistence(timeout: 2.0)
        XCTAssertEqual(3, app.collectionViews["questionList"].cells.count)
    }
    
}

final class when_user_submit_quiz_without_answering_all_questions
: XCTestCase {
    func test_should_display_error_message_on_the_screen() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        
        let quizList = app.collectionViews["quizList"]
        quizList.cells.element(boundBy: 0).staticTexts["Math 101"].tap()
        
        let _ = app.buttons["submitQuiz.Button"].waitForExistence(timeout: 2.0)
        
        app.buttons["submitQuizButton"].tap()
        
        XCTAssertEqual(Constants.Messages.quizSubmissonFailed, app.staticTexts["messageText"].label)
        
    }
}

class when_user_submits_quiz: XCTestCase {
    func test_should_navigate_to_the_screen() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        
        let quizList = app.collectionViews["quizList"]
        quizList.cells.element(boundBy: 0).staticTexts["Math 101"].tap()
        
        let questionListTable = app.collectionViews["questionList"]
        questionListTable.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "정사각형").element(boundBy: 1).tap()
        
        questionListTable.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "정사각형").element(boundBy: 2).tap()
        
        questionListTable.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "정사각형").element(boundBy: 3).tap()
        
        
        app.buttons["submitQuizButton"].tap()
        XCTAssertTrue(app.staticTexts["A"].waitForExistence(timeout: 2.0))
        
    }
}
