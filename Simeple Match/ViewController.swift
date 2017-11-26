//
//  ViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 11. 26..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumText: UITextField!
    @IBOutlet weak var secondNumText: UITextField!
    @IBOutlet weak var operationText: UITextField!
    @IBOutlet weak var userAnswerText: UITextField!
    @IBOutlet weak var systemAnswerText: UITextField!
    
    let MAX_NUM : UInt32 = 20
    
    var finalSystemAnswer : Int = 0
    var systemOperationType : String = "+"
    var firstNumber : Int = 0
    var secondNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operationText.text = systemOperationType
        systemSelectRandomNumber()
    }

    func systemSelectRandomNumber() {
        firstNumber = Int(arc4random_uniform(MAX_NUM)+2)
        secondNumber = Int(arc4random_uniform(MAX_NUM)+2)
        
        firstNumText.text = String(firstNumber)
        secondNumText.text = String(secondNumber)
        
        systemAnswerText.text = ""
        userAnswerText.text = ""
        
    }
    
    func plus(firstNum:Int, secondNum:Int)->Int{
        return firstNum + secondNum
    }

    @IBAction func userCheckAnswer(_ sender: Any) {
        switch(systemOperationType){
        case "+" :
            finalSystemAnswer = plus(firstNum: firstNumber, secondNum: secondNumber)
    
        case "-" :
            finalSystemAnswer = plus(firstNum: firstNumber, secondNum: secondNumber)

        case "*" :
            finalSystemAnswer = plus(firstNum: firstNumber, secondNum: secondNumber)

        case "/" :
            finalSystemAnswer = plus(firstNum: firstNumber, secondNum: secondNumber)

        default :
            finalSystemAnswer = 0
        }
        systemAnswerText.text = String(finalSystemAnswer)
    }
    
    @IBAction func refreshProblem(_ sender: Any) {
        systemSelectRandomNumber()
    }
    
}

