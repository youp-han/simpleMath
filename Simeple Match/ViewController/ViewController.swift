//
//  ViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 11. 26..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerText: UITextField!
    @IBOutlet weak var totalQNoLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var questionNumber : Int = 0
    var score : Int = 0
    let totalQuestionNumber : Int = 50
    let systemOperationType : String = "+"

    
    let bank = QuestionBank(totalQuestionNo: 50, gameLevel: 1, gameType : "+")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkQuestionBank()
        setUI()
    }
    
    @IBAction func refreshProblem(_ sender: Any) {
        self.checkAnswer()
        questionNumber += 1
        setUI()
    }
    
    
    //check questions in Bank
    func checkQuestionBank(){
        for i in (0...totalQuestionNumber - 1) {
            print ( "\(i))" + " \(bank.questionList[i].questionText)" + "\(bank.questionList[i].calculatedAnswer)" )
        }
    }
    
    
    //generate random numbers to calculate
    func setUI() {
        if (questionNumber >= totalQuestionNumber){
            questionNumber = 0
            score = 0
            print ("game over")
        }
        questionLabel.text = bank.questionList[questionNumber].questionText
        userAnswerText.text = ""
        totalQNoLabel.text = "\(questionNumber + 1)" + "/" + "\(totalQuestionNumber)"
        scoreLabel.text = "Score: \(score)"
    }
    
    //check user's answer with the system's answer and return bool value
    func checkAnswer(){
        if(userAnswerText.text=="") { userAnswerText.text = "0" }
        if (Double(userAnswerText.text!)! == (Double(bank.questionList[questionNumber].calculatedAnswer))){
            score += 1
        }
    }

   
}



