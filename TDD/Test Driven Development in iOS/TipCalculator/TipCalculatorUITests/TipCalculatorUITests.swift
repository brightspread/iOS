//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Leo on 2023/06/30.
//

import XCTest

// class는 context로 정함(상황)
class contentView_가_보일_때: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() { // 'class'(static) 빼고 작성 - instance method만 다룸
        app = XCUIApplication()
        continueAfterFailure = false // fail시 중단
        app.launch()
    }

    // 아래 테스트들은 독립적임 -> XCUIApplication을 새로 만듦
    // 모든 테스트 마다 app을 새로 만들어서 시작함
    
    func test_totalTextField_가_기본값을_가져야_함() {

        let totalTextField = app.textFields["totalTextField"]
        /*
         TextField("Enter total", text: $total)
             .accessibilityIdentifier("totalTextField") - 이거로 연결고리 만들어줌
         */
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
    }
    
    func test_기본_tip_옵션이_20퍼센트_여야함() {
        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"]
        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)

        XCTAssertEqual(segmentedControlButton.label, "20%") // Text 확인
        XCTAssertTrue(segmentedControlButton.isSelected) // 선택되어있는지 확인
    }
    
    override func tearDown() { // 각 테스트 종료시에 호출됨
        // clean up function
        // ex: file 생성했다면 삭제
    }
}


class calculate_팁_버튼이_눌릴때: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("100")

        //context가 팁 버튼 눌릴때임!
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
    }
    
    func test_tip이_화면에_보여야함() {
        let tipText = app.staticTexts["tipText"]
        tipText.waitForExistence(timeout: 0.5) // 시간 조금 걸리니까 버튼 누르는 시간 기다림
        
        XCTAssertEqual(tipText.label, "$20.00")
    }
}
