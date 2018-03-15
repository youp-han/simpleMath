//
//  QuestionBank.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

// desc: QuestionBank class
class QuestionBank{
    var questionList = [Question]()
    
    var firstNum : Double = 0.0
    var secondNum : Double = 0.0
    lazy var operationType : String = ""
    
    lazy var upperLimit : Int = 0
    var firstNumLimit : UInt32 = 0
    var secondNumLimit : UInt32 = 0
    
    
    // desc: class initialization
    init(){
    }
    
    init(practiceLevel : Int, sublevel : Int, noOfQuestions : Int, gameType : String) {
        self.upperLimit = noOfQuestions
        self.operationType = gameType

        //setting 2 numbers by difficulties
        switch (gameType) {
        case "+" :
            self.setGameDifficultiesForPlusAndMinus(practiceLevel: practiceLevel, sublevel: sublevel )
        case "-" :
            self.setGameDifficultiesForPlusAndMinus(practiceLevel: practiceLevel, sublevel: sublevel)
        case "*" :
            self.setGameDifficultiesForMultiply(practiceLevel: practiceLevel, sublevel: sublevel)
        default:
            self.setGameDifficultiesForDivision(practiceLevel: practiceLevel, sublevel: sublevel)
        }

        for _ in (1...upperLimit) {
            self.questionList.append(Question(question: self.buildQuestion(), answer: self.getAnswer()))
        }
    }
    
    // desc: building Questions
    func buildQuestion () -> String{
        
        switch (operationType) {
        case "+" :
            return forPlusAndMinus()
        case "-" :
            return forPlusAndMinus()
        case "*" :
            return forMultiply()
        default:
            return forDivision()
        }
    }

    // desc: setting Difficulties for Plue and Minus
    func setGameDifficultiesForPlusAndMinus (practiceLevel: Int, sublevel: Int) {
        switch (practiceLevel){
        case 1:
            self.firstNumLimit = 10
        case 2:
            self.firstNumLimit = 100
        case 3:
            self.firstNumLimit = 100
        case 4:
            self.firstNumLimit = 1000
        default:
            self.firstNumLimit = 10000
        }
        
        self.secondNum = Double(sublevel)
    }
    
    // desc: setting Difficulties for Multiply
    func setGameDifficultiesForMultiply (practiceLevel: Int, sublevel: Int) {
        switch (practiceLevel){
        case 1:
            self.firstNumLimit = 10
        case 2:
            self.firstNumLimit = 100
        case 3:
            self.firstNumLimit = 100
        case 4:
            self.firstNumLimit = 1000
        default:
            self.firstNumLimit = 10000
        }
        
        self.secondNum = Double(sublevel)
        
    }
    
    // setting Difficulties for Division
    func setGameDifficultiesForDivision (practiceLevel: Int, sublevel: Int) {
        switch (practiceLevel){
        case 1:
            self.firstNumLimit = 10
        case 2:
            self.firstNumLimit = 100
        case 3:
            self.firstNumLimit = 100
        case 4:
            self.firstNumLimit = 1000
        default:
            self.firstNumLimit = 10000
        }
        
        self.secondNum = Double(sublevel)
        
    }
    
    
    func forPlusAndMinus () -> String{
        self.getFirstNum()
        return String(format: "%.f", firstNum) + " \(operationType)" + String(format: "%.f", secondNum) + " = "
    }
    
    func forMultiply () -> String{
        self.getFirstNum()
        return String(format: "%.f", firstNum) + " \(operationType)" + String(format: "%.f", secondNum) + " = "
    }
    
    func forDivision () -> String{
        self.getFirstNum()
        return String(format: "%.f", firstNum) + " \(operationType)" + String(format: "%.f", secondNum) + " = "
    }
    
    
    //get Ansers for built Questions
    func getAnswer () -> Double{
        let calc = Calculator(firstNum: firstNum, secondNum: secondNum, operation: operationType)
        return calc.performOperation()
    }
    
    //First Number Not 0
    func getFirstNum () {
        firstNum = Double(arc4random_uniform(firstNumLimit))
        if (firstNum == 0) {
             getFirstNum()
        }
    }
}
