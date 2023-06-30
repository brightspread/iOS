//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Leo on 2023/06/27.
//

import XCTest

// class 이름도 wordy, descriptive 해야함
// TipCalculatorUnitTests -> when_calculating_tip_based_on_total_amount
final class when_calculating_tip_based_on_total_amount: XCTestCase {

    // function의 이름은 상세해야함
    func test_should_calculate_tip_successfully() {
        
        let tipCalculator = TipCalculator()
        // 아직 TipCalculator 클래스를 작성하지 않아서, 컴파일되진 않지만
        // 있다고 가정하고 작성하는 것이 Test Code의 묘미임
        let tip = try! tipCalculator.calculate(total: 100, tipPercentage: 0.1)
        XCTAssertEqual(10, tip)
    }
}


// amount가 음수일때 테스트
class when_calculating_tip_based_on_negative_total_amount: XCTestCase {
    func test_should_throw_invalid_input_exception() {
        let tipCalculator = TipCalculator()
        XCTAssertThrowsError(try tipCalculator.calculate(total: -100, tipPercentage: 0.1), "") { error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
        }
    }
}
