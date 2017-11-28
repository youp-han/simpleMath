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
    var systemOperationType : String = "+"
    let calc = CoreCalc()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operationText.text = systemOperationType
        systemSelectRandomNumber()
    }

    func systemSelectRandomNumber() {
        
        calc.maxNum = MAX_NUM
        calc.getRandomNumber()
        firstNumText.text = String(calc.firstNum)
        secondNumText.text = String(calc.secondNum)
        systemAnswerText.text = ""
        userAnswerText.text = ""
        self.userAnswerText.backgroundColor = UIColor.white

    }
    
    func checkAnswer()->Bool{
        
        if(userAnswerText.text=="") { userAnswerText.text = "0" }
        
        calc.operationType = systemOperationType
        calc.userInputNum = Int(userAnswerText.text!)!
        //systemAnswerText.text = String(calc.operationCalc())
        
        if calc.checkAnswer(){
            return true
            
        }
        else{
            return false
            
        }
        
    }
    
    @IBAction func refreshProblem(_ sender: Any) {
        self.normalCheckAnswer()
    }
    
    //
    func normalCheckAnswer(){
        
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
    
    //
    func timeAttackCheckAnswer(){
        
    }
    
}

