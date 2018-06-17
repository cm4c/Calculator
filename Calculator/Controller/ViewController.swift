//
//  ViewController.swift
//  Calculator
//
//  Created by Caleb Maccarone on 2/19/18.
//  Copyright © 2018 Caleb Maccarone. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    let calculator = Calculator()
    @IBOutlet weak var display: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        let digit = sender.currentTitle!
        self.calculator.inputDigit(digit)
        updateDisplay()
    }
    
    @IBAction func operations(_ sender: UIButton) {
        guard let operation = Operator(rawValue: sender.currentTitle ?? "") else {
            return
        }
        self.calculator.operate(operation)
        updateDisplay()
    }
    
    @IBAction func equals(_ sender: UIButton) {
        self.calculator.evaluate()
        updateDisplay()
    }

    func updateDisplay() {
        self.display.text = self.calculator.display
    }

}
