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
    private var contentViewPage: ContentViewPage!
    
    override func setUp() { // 'class'(static) 빼고 작성 - instance method만 다룸
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false // fail시 중단
        app.launch()
    }

    // 아래 테스트들은 독립적임 -> XCUIApplication을 새로 만듦
    // 모든 테스트 마다 app을 새로 만들어서 시작함
    
    func test_totalTextField_가_기본값을_가져야_함() {

        //let totalTextField = contentViewPage.totalTextField
        /*
         TextField("Enter total", text: $total)
             .accessibilityIdentifier("totalTextField") - 이거로 연결고리 만들어줌
         */
        XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
    }
    
    func test_기본_tip_옵션이_20퍼센트_여야함() {
        //let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"]
        let segmentedControlButton = contentViewPage.tipPercentageSegmentedControl.buttons.element(boundBy: 1)

        XCTAssertEqual(segmentedControlButton.label, "20%") // Text 확인
        XCTAssertTrue(segmentedControlButton.isSelected) // 선택되어있는지 확인
    }
    
    override func tearDown() { // 각 테스트 종료시에 호출됨
        // clean up function
        // ex: file 생성했다면 삭제
    }
}



// setup에서 이미 100으로 코드 만든 경우에 어떻게 할까?
// -> class를 나누거나
// -> 각 테스트 별로 넣어줌
// 여기선 각 테스트별로 입력하는걸 넣자
// -> 리팩토링 ㄱㄱ 클래스를 나누자 (valid Input vs invliad input)
class calculate_팁_버튼이_눌릴때_with_invalid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!

    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()

        //let totalTextField = app.textFields["totalTextField"]
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("-100")

        //context가 팁 버튼 눌릴때임!
        //let calculateTipButton = app.buttons["calculateTipButton"]
        let calculateTipButton = contentViewPage.calculateTipButton
        calculateTipButton.tap()
    }
    
    func test_잘못입력시_tip레이블_지워져야함() {
        
        //let tipText = app.staticTexts["tipText"]
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "")
    }

    func test_잘못입력시_에러메시지_보여야함() {
        //let messageText = app.staticTexts["messageText"]
        let messageText = contentViewPage.messageText
        let _ = messageText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(messageText.label, "Invalid Input")
    }

}


class calculate_팁_버튼이_눌릴때_with_valid_input: XCTestCase {

    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!

    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
    }
    
    func test_tip이_화면에_보여야함() {
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("100")

        //context가 팁 버튼 눌릴때임!
        let calculateTipButton = contentViewPage.calculateTipButton
        calculateTipButton.tap()

        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5) // 시간 조금 걸리니까 버튼 누르는 시간 기다림
        XCTAssertEqual(tipText.label, "$20.00")
    }
    
    // 하단의 레코드 버튼으로 테스트코드를 작성할 수 있다.
    func test_record테스트_10퍼센트_100토탈_팁은() {
        
        
        let app = XCUIApplication()
        let totaltextfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["totalTextField"]/*[[".textFields[\"Enter total\"]",".textFields[\"totalTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        totaltextfieldTextField.tap()
        totaltextfieldTextField.typeText("100")
        app/*@START_MENU_TOKEN@*/.buttons["10%"]/*[[".segmentedControls[\"tipPercentageSegmentedControl\"].buttons[\"10%\"]",".buttons[\"10%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["calculateTipButton"]/*[[".buttons[\"Calculate Tip\"]",".buttons[\"calculateTipButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let tipText = app.staticTexts["tipText"]
        tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "$10.00")
                
    }
}


// ui object 접근할때마다 이름으로 접근하고 있음 (textFields["totalTextField"])
// 나중에 문제 생길 가능성이 있음!
// pageObject pattern을 사용하자
