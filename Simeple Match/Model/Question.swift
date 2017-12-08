//
//  Question.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let calculatedAnswer : String
    
    init(question:String, answer:Double){
        questionText = question
        calculatedAnswer = String(answer)
    }
}
