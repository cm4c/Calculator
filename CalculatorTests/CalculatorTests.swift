//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Korben Allen Rusek on 6/17/18.
//  Copyright © 2018 Caleb Maccarone. All rights reserved.
//

import XCTest
import Calculator

class CalculatorTests: XCTestCase {
    
    var calculator: Calculator = Calculator()
    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
    }
    
    func testMultipleEvaluate() {
        calculator.inputDigit("8")
        calculator.operate(.subtract)
        XCTAssertEqual("8", calculator.display)
        calculator.inputDigit("16")
        calculator.evaluate()
        XCTAssertEqual("-8", calculator.display)
        calculator.evaluate()
        XCTAssertEqual("-24", calculator.display)
        calculator.evaluate()
        XCTAssertEqual("-40", calculator.display)
    }
    
    func testDecimalInput() {
        calculator.inputDigit("8")
        calculator.inputDigit(".")
        XCTAssertEqual("8.", calculator.display)
        calculator.inputDigit("3")
        XCTAssertEqual("8.3", calculator.display)
    }
    
    func testSimpleDecimalOk() {
        calculator.inputDigit("8")
        calculator.inputDigit(".")
        calculator.operate(.add)
        calculator.inputDigit("8")
        calculator.evaluate()
        XCTAssertEqual("16", calculator.display)
    }
    
    func testPercent() {
        calculator.inputDigit("16")
        calculator.operate(.percent)
        XCTAssertEqual("0.16", calculator.display)
        calculator.operate(.percent)
        XCTAssertEqual("0.0016", calculator.display)
    }
    
}
