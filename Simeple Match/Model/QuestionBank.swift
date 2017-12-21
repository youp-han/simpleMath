//
//  QuestionBank.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

//desc: QuestionBank class
class QuestionBank{
    var questionList = [Question]()
    
    var firstNum : Double = 0.0
    var secondNum : Double = 0.0
    lazy var operationType : String = ""
    
    lazy var upperLimit : Int = 0
    var firstNumLimit : UInt32 = 0
    var secondNumLimit : UInt32 = 0
    
    
    //class initialization
    init(){
    }
    
    init(totalQuestionNo : Int, gameLevel : Int, gameType : String) {
        self.upperLimit = totalQuestionNo
        self.operationType = gameType
        
        self.setGameDifficulties(gameLevel: gameLevel)

        for _ in (1...upperLimit) {
            self.questionList.append(Question(question: self.buildQuestion(), answer: self.getAnswer()))
        }
    }
    
    func buildQuestion () -> String{
        self.firstNum = Double(arc4random_uniform(firstNumLimit))
        self.secondNum = Double(arc4random_uniform(secondNumLimit))

        return String(format: "%.f", firstNum) + " \(operationType)" + String(format: "%.f", secondNum) + " = "
    }
    
    func getAnswer () -> Double{
        let calc = Calculator(firstNum: firstNum, secondNum: secondNum, operation: operationType)
        return calc.performOperation()
    }
    
    func setGameDifficulties (gameLevel: Int) {
        switch (gameLevel){
        case 1:
            self.firstNumLimit = 50
            self.secondNumLimit = 10
        case 2:
            self.firstNumLimit = 100
            self.secondNumLimit = 10
        case 3:
            self.firstNumLimit = 200
            self.secondNumLimit = 10
        case 4:
            self.firstNumLimit = 100
            self.secondNumLimit = 100
            
        default:
            self.firstNumLimit = 1000
            self.secondNumLimit = 1000
        }
        
    }
}
