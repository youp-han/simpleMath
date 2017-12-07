//: Playground - noun: a place where people can play

import UIKit

struct Calculator{
    var firstNum: Double = 0.0
    var secondNum: Double = 0.0
    var operation: String = ""
    func performOperation () -> Double{
        switch (operation) {
            case "+" :
                return firstNum + secondNum
            case "-" :
                return firstNum - secondNum
            case "*" :
                return firstNum * secondNum
            case "/" :
                if (secondNum > 0) {
                    return firstNum / secondNum
                }else{
                    return 0
                }
        default:
            print("not known operator")
            return 0
        }
    }
}

class Question {
    let questionText : String
    let calculatedAnswer : String
    
    init(question:String, answer:Double){
        questionText = question
        calculatedAnswer = String(answer)
    }
}

class QuestionBank{
    var questionList = [Question]()
    var firstNum : Double = 0.0
    var secondNum : Double = 0.0
    var operationType : String = "+"
    var upperLimit : Int = 50
    var firstNumLimit : UInt32 = 99
    var secondNumLimit : UInt32 = 99
    
    init() {
        for _ in (1...upperLimit) {
            questionList.append(Question(question: self.buildQuestion(), answer: self.getAnswer()))
        }
    }
    
    func buildQuestion () -> String{
        firstNum = Double(arc4random_uniform(firstNumLimit))
        secondNum = Double(arc4random_uniform(secondNumLimit))
        return "\(firstNum) \(operationType) \(secondNum)"
    }
    
    func getAnswer () -> Double{
        let calc = Calculator(firstNum: firstNum, secondNum: secondNum, operation: operationType)
        return calc.performOperation()
    }
}


let bank = QuestionBank()
for i in (0...49) {
    print ( "\(i).)" + " \(bank.questionList[i].questionText)" + " = " + "\(bank.questionList[i].calculatedAnswer)" )
}








