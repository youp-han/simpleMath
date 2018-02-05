//
//  CoreCalc.swift
//  Simeple Match
//
//  Created by mike han on 2017. 11. 27..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

//desc: Calculator Structure
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
                return String(format: "%.f", divide(firstNum: firstNum, secondNum: secondNum)) + " .. " + \" String(format: "%.f", divide(firstNum: firstNum, secondNum: secondNum)) (remainder(firstNum: firstNum, secondNum: secondNum)) "
            }else{
                return 0
            }
        default:
            print("not known operator")
            return 0
        }
        
    }
    
    func divide (firstNum: Double, secondNum: Double)-> Int {
        return (Int(firstNum) / Int(secondNum))
        
    }
    
    func remainder (firstNum: Double, secondNum: Double)-> Double {
        return Double(Int(firstNum) % Int(secondNum))
        
    }
}



