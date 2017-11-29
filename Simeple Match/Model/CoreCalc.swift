//
//  CoreCalc.swift
//  Simeple Match
//
//  Created by mike han on 2017. 11. 27..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

class CoreCalc: NSObject {
    
    var firstNum : Double = 0
    var secondNum : Double = 0
    var operationType : String = "+"
    var maxNum : UInt32 = 0
    var userInputNum : Double = 0
    
    func plus()->Double{
        return firstNum + secondNum
    }
    
    func minus()->Double{
        return firstNum - secondNum
    }
    
    func times()->Double{
        return firstNum * secondNum
    }
    
    func divide()->Double{
        if (secondNum != 0){
            return firstNum / secondNum
        }
        else {
            return 0
        }
    }
    
    func operationCalc()->Double{
        
        switch(operationType){
        case "+" :
            return plus()
            
        case "-" :
            return minus()
            
        case "*" :
            return times()
            
        case "/" :
            return divide()
            
        default :
            return 0
        }
    }
    
    func getRandomNumber() {
        firstNum = Double(arc4random_uniform(maxNum)+2)
        secondNum = Double(arc4random_uniform(maxNum)+2)
    }
    
    func checkAnswer()->Bool{
        if(operationCalc() == userInputNum){
            return true
        }else{
            return false
        }
    }
    
}


