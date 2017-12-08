//
//  QuestionBank.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

class QuestionBank{
    var questionList = [Question]()
    
    var firstNum : Double = 0.0
    var secondNum : Double = 0.0
    var operationType : String = ""
    
    var upperLimit : Int = 0
    var firstNumLimit : UInt32 = 0
    var secondNumLimit : UInt32 = 0
    
    
    //class initialization
    init(totalQuestionNo : Int, gameLevel : Int, gameType : String) {
        upperLimit = totalQuestionNo
        operationType = gameType
        
        if (gameLevel > 1){
            firstNumLimit = 99
            secondNumLimit = 99
        }else{
            firstNumLimit = 99
            secondNumLimit = 10
        }
        
        for _ in (1...upperLimit) {
            questionList.append(Question(question: self.buildQuestion(), answer: self.getAnswer()))
        }
        
    }
    
    
    func buildQuestion () -> String{
        firstNum = Double(arc4random_uniform(firstNumLimit))
        secondNum = Double(arc4random_uniform(secondNumLimit))
        return String(format: "%.f", firstNum) + " \(operationType)" + String(format: "%.f", secondNum) + " = "
    }
    
    func getAnswer () -> Double{
        let calc = Calculator(firstNum: firstNum, secondNum: secondNum, operation: operationType)
        return calc.performOperation()
    }
}
