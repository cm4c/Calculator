//
//  ViewController.swift
//  Calculator
//
//  Created by Caleb Maccarone on 2/19/18.
//  Copyright © 2018 Caleb Maccarone. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    var numbersHaveBeenTyped : Bool = false
    var decimalHasBeenAdded = false
    var num1Storage : Double = 0
    var num2Storage : Double = 0
    var operatorStorage : String = ""
    var operation : String = ""
    @IBOutlet weak var display: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if numbersHaveBeenTyped {
            let currentDisplay = display.text!
            switch digit {
            case "1","2","3","4","5","6","7","8","9":
                if currentDisplay == "0" {
                    display.text = digit
                } else {
                    display.text = currentDisplay + digit
                }
            case ".":
                if !currentDisplay.hasSuffix(".") && !decimalHasBeenAdded {
                    display.text = currentDisplay + digit
                    decimalHasBeenAdded = true
                }
            case "0":
                if currentDisplay != "0" {
                    display.text = currentDisplay + digit
                }
            default:
                display.text = "Error"
            }
        }else {
            display.text = digit
        }
        numbersHaveBeenTyped = true
    }
    @IBAction func operations(_ sender: UIButton) {
        decimalHasBeenAdded = false
        numbersHaveBeenTyped = false
        operation = sender.currentTitle!
        
        operatorStorage = operation
        switch operation {
        case "C":
            display.text = ""
            num1Storage = 0
            decimalHasBeenAdded = false
        case "%":
            display.text = String(Double(display.text!)!/100)
        case "÷":
            rememberNumbers()
        case "X":
            rememberNumbers()
        case "-":
            rememberNumbers()
        case "+":
            rememberNumbers()
        default:
            display.text = "error"}
    }
    func rememberNumbers() {
        num1Storage = Double(display.text!)!
     numbersHaveBeenTyped = false
    }
    @IBAction func equals(_ sender: UIButton) {
        let negAndEquals = sender.currentTitle!
        switch negAndEquals {
        case "+/-":
            display.text = String(-Double(display.text!)!)
        case "=":
            num2Storage = Double(display.text!)!
            switch operatorStorage {
            case "÷":
               display.text! = String(num1Storage/num2Storage)
            case "X":
                display.text! = String(num1Storage*num2Storage)
            case "-":
                display.text! = String(num1Storage-num2Storage)
            case "+":
                display.text! = String(num1Storage+num2Storage)
            default:
                display.text = "error"}
                
        default:
             display.text = "error"
        }
        
        }
    }



