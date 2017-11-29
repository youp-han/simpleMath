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
    
    let MAX_NUM : UInt32 = 20
    var systemOperationType : String = "+"
    let calc = CoreCalc()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operationText.text = systemOperationType
        systemSelectRandomNumber()
    }
    
    @IBAction func refreshProblem(_ sender: Any) {
        self.practiceCheckAnswer()
    }
    
    //generate random numbers to calculate
    func systemSelectRandomNumber() {
        
        calc.maxNum = MAX_NUM
        calc.getRandomNumber()
        firstNumText.text = String(format: "%.f", calc.firstNum)
        secondNumText.text = String(format: "%.f", calc.secondNum)
        userAnswerText.text = ""
        self.userAnswerText.backgroundColor = UIColor.white
        
    }
    
    //check user's answer with the system's answer and return bool value
    func checkAnswer()->Bool{
        
        if(userAnswerText.text=="") { userAnswerText.text = "0" }
        
        calc.operationType = systemOperationType
        calc.userInputNum = Double(userAnswerText.text!)!
        if calc.checkAnswer(){
            return true
            
        }
        else{
            return false
            
        }
        
    }
    
    //checking answer for the practice Mode
    func practiceCheckAnswer(){
        
        if(checkAnswer()){
            userAnswerText.backgroundColor = UIColor.blue
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when){
                self.systemSelectRandomNumber()
            }
        }else{
            userAnswerText.backgroundColor = UIColor.red
        }
    }
    
    //checking answer for the time attack mode
    func timeAttackCheckAnswer(){
        self.systemSelectRandomNumber()
    }
    
}

