//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Leo on 2023/06/30.
//

import XCTest

final class contentView_가_보일_때: XCTestCase {

    func test_totalTextField_가_기본값을_가져야_함() {

        let app = XCUIApplication()
        continueAfterFailure = false // failure가 있으면 테스트 중단
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        /*
         TextField("Enter total", text: $total)
             .accessibilityIdentifier("totalTextField") - 이거로 연결고리 만들어줌
         */
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
    }
    
    func test_기본_tip_옵션이_20퍼센트_여야함() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"]
        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)

        XCTAssertEqual(segmentedControlButton.label, "20%") // Text 확인
        XCTAssertTrue(segmentedControlButton.isSelected) // 선택되어있는지 확인
    }
}
