//
//  Calculator.swift
//  Calculator
//
//  Created by Caleb Maccarone on 2/19/18.
//  Copyright © 2018 Caleb Maccarone. All rights reserved.
//

import Foundation

class Calculator {
    var numberTyped : Int = 0
    var numRemembered : Int = 0
    
    func add() {
        numRemembered = numberTyped
        numberTyped = 0
    }
    
}
