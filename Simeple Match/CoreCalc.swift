//
//  CoreCalc.swift
//  Simeple Match
//
//  Created by mike han on 2017. 11. 27..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

class CoreCalc: NSObject {
    
    var firstNum : Int = 0
    var secondNum : Int = 0
    var operationType : String = "+"
    var maxNum : UInt32 = 0
    
    func plus()->Int{
        return firstNum + secondNum
    }
    
    func minus()->Int{
        return firstNum - secondNum
    }
    
    func times()->Int{
        return firstNum * secondNum
    }
    
    func divide()->Int{
        if (secondNum != 0){
            return firstNum / secondNum
        }
        else {
            return 0
        }
    }
    
    func operationCalc()->Int{
        
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
        firstNum = Int(arc4random_uniform(maxNum)+2)
        secondNum = Int(arc4random_uniform(maxNum)+2)
    }
    
}


