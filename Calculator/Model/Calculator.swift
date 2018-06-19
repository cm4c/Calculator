//
//  Calculator.swift
//  Calculator
//
//  Created by Caleb Maccarone on 2/19/18.
//  Copyright © 2018 Caleb Maccarone. All rights reserved.
//

import Foundation

public enum Operator: String {
    case add = "+", subtract = "-", multiply = "X", divide = "÷", percent = "%", negate = "+/-", clear = "C"
}

enum Display {
    case current(String),
    error,
    previous(String)
}

public class Calculator {
    public var display: String {
        switch _display {
        case .current(let value) where value.isEmpty:
            return "0"
        case .current(let value):
            return (value.hasSuffix(".0")) ? String(format: "%.0f", Double(value)!) : value
        case .previous(let value):
            return (value.hasSuffix(".0")) ? String(format: "%.0f", Double(value)!) : value
        case .error:
            return "Error"
        }
    }
    
    private var currentNumber: Double {
        switch _display {
        case .current(let value):
            return Double(value) ?? 0.0
        case .previous(let value):
            return Double(value) ?? 0.0
        default:
            return 0.0
        }
    }
    private var previousNumber: Double = 0
    private var _display: Display = .current("")
    private var op: Operator?
    var lastOperation: (Operator, Double) = (.add, 0.0)
    
    public func operate(_ op: Operator) {
        switch op {
        case .percent:
            _display = .current("\(currentNumber / 100)")
        case .negate:
            _display = .current("\(-1*currentNumber)")
        case .clear:
            if case .current(let value) = _display, !value.isEmpty {
                _display = .current("")
            } else {
                _display = .current("")
                previousNumber = 0
            }
        default:
            self.op = op
            previousNumber = currentNumber
            if case .current(let value) = _display {
                _display = .previous(value)
            }
        }
    }
    
    public func evaluate() {
        let operation: (Operator, Double)
        if let op = self.op {
            operation = (op, self.currentNumber)
        } else {
            operation = self.lastOperation
        }
        self.lastOperation = operation
        self.op = nil
        
        let newValue: Double?
        switch operation {
        case (.add, let value):
            newValue = self.previousNumber + value
        case (.subtract, let value):
            newValue = self.previousNumber - value
        case (.divide, let value) where value != 0:
            newValue = self.previousNumber / value
        case (.multiply, let value):
            newValue = self.previousNumber * value
        default:
            newValue = nil
        }
        
        if let value = newValue {
            self.previousNumber = value
            self._display = .previous("\(value)")
        } else {
            self.error()
        }
    }
    
    public func inputDigit(_ digit: String) {
        let display: String
        if case .current(let value) = _display {
            display = value
        } else {
            display = ""
        }
        
        switch digit {
        case ".":
            if self.hasDecimal {
                self.error()
            } else if display.isEmpty {
                _display = .current("0.")
            } else {
                _display = .current(display + ".")
            }
        case "0":
            if display.isEmpty {
                _display = .current("0")
                return
            } else if display == "0" {
                return
            }
            fallthrough
        default:
            if display == "0" {
                _display = .current(digit)
            } else {
                _display = .current(display + digit)
            }
        }
    }
    
    public init() {
        
    }
    
    func error() {
        self._display = .error
        self.previousNumber = 0
    }
    
    private var hasDecimal: Bool {
        return display.contains(".")
    }
    
}
