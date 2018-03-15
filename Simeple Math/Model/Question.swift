//
//  Question.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

//desc: Question Class
class Question {
    let questionText : String
    let calculatedAnswer : String
    var status : Int = 0
    var userAnswer : Int = 0
    
    init(question:String, answer:String){
        self.questionText = question
        self.calculatedAnswer = answer
        self.status = 0
        self.userAnswer = 0
        
    }
}
