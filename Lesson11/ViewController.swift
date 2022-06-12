//
//  ViewController.swift
//  Lesson11
//
//  Created by Ilia Zakharov on 09.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isNewValue = true
    var operation: MathOperation? = nil
    var previousOperation: MathOperation? = nil
    var result: Double = 0
    var newValue: Double = 0
    
    
    @IBAction func onOne(_ sender: Any) {
        addDigit("1")
    }
    @IBAction func onTwo(_ sender: Any) {
        addDigit("2")
    }
    @IBAction func onThree(_ sender: Any) {
        addDigit("3")
    }
    @IBAction func onFour(_ sender: Any) {
        addDigit("4")
    }
    @IBAction func onFive(_ sender: Any) {
        addDigit("5")
    }
    @IBAction func onSix(_ sender: Any) {
        addDigit("6")
    }
    @IBAction func onSeven(_ sender: Any) {
        addDigit("7")
    }
    @IBAction func onEight(_ sender: Any) {
        addDigit("8")
    }
    @IBAction func onNine(_ sender: Any) {
        addDigit("9")
    }
    @IBAction func onZero(_ sender: Any) {
        addDigit("0")
    }
    @IBAction func onDot(_ sender: Any) {
        addDigit(".")
    }
    
    
    
    @IBAction func onEqual(_ sender: Any) {
        calculate()
    }
    @IBAction func onPlus(_ sender: Any) {
        operation = .sum
        previousOperation = nil
        isNewValue = true
        result = getValue()
    }
    @IBAction func onMinus(_ sender: Any) {
        operation = .substract
        previousOperation = nil
        isNewValue = true
        result = getValue()
    }
    @IBAction func onMultiply(_ sender: Any) {
        operation = .multiplay
        previousOperation = nil
        isNewValue = true
        result = getValue()
    }
    @IBAction func onDivide(_ sender: Any) {
        operation = .divide
        previousOperation = nil
        isNewValue = true
        result = getValue()
    }
    
    
    @IBAction func onReset(_ sender: Any) {
        isNewValue = true
        result = 0
        newValue = 0
        operation = nil
        previousOperation = nil
        resultLabel.text = "0"
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ConstantStrings.CalculatorTitle
    }
    

    func addDigit(_ digit: String) {
        if isNewValue {
            resultLabel.text = ""
            isNewValue = false
        }
        var digits = resultLabel.text
        digits?.append(digit)
        resultLabel.text = digits
    }
    
    func getValue() -> Double {
        return Double(resultLabel.text ?? "0") ?? 0
    }
    
    func calculate() {
        guard let operation = operation else {
            return
        }
        if previousOperation != operation {
            newValue = getValue()
        }
        
        operation.makeOperation(result: result, newValue: newValue)
        
        previousOperation = operation
        
        resultLabel.text = "\(operation.makeOperation(result: result, newValue: newValue))"
        isNewValue = true
    }
}

enum MathOperation {
    case sum, substract, multiplay, divide
    
    func makeOperation(result: Double, newValue: Double) -> Double {
        switch self {
        case .sum :
            return (result + newValue)
        case .substract :
            return (result - newValue)
        case .multiplay :
            return (result * newValue)
        case .divide :
            if newValue == 0 {
                print("cant divide")
                return 0
            }
            return (result / newValue)
        }
    }
}
