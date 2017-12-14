//
//  ViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 11. 26..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class CoreViewController: UIViewController {
    
    //desc: local properties
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerText: UITextField!
    @IBOutlet weak var totalQNoLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    //desc local variables
    var score : Int = 0
    var questionNumber = 0
    var bank = QuestionBank()
    
    //desc: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkQuestionBank()
        nextQuestion()
    }
    
    //desc: action when button pressed
    @IBAction func refreshProblem(_ sender: Any) {
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    //desc: move to the next Question
    func nextQuestion() {
        if (questionNumber >= bank.questionList.count){
            questionNumber = 0
            score = 0
            print ("game over")
            nextQuestion()
            
        }else{
            questionLabel.text = bank.questionList[questionNumber].questionText
            userAnswerText.text = ""
            totalQNoLabel.text = "\(questionNumber + 1)" + "/" + "\(bank.questionList.count)"
            scoreLabel.text = "Score: \(score)"

        }
    }
    
   
    //desc: check user's answer with the system's answer and return bool value
    func checkAnswer(){
        if(userAnswerText.text=="") { userAnswerText.text = "0" }
        if (questionNumber < bank.questionList.count){
            if (Double(userAnswerText.text!)! == (Double(bank.questionList[questionNumber].calculatedAnswer))){
                score += 1
            }
        }
    }
    
    
    
    //desc: check questions in Bank
    //can be blocked
    func checkQuestionBank(){
        for i in (0...bank.questionList.count - 1) {
            print ( "\(i))" + " \(bank.questionList[i].questionText)" + "\(bank.questionList[i].calculatedAnswer)" )
        }
    }

   
}



