//
//  ViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 11. 26..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class CoreViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerText: UITextField!
    @IBOutlet weak var totalQNoLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func closeWindow(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var questionNumber : Int = 0
    var score : Int = 0
    var totalQuestionNumber : Int = 50
    var systemOperationType : String = ""

    
    let bank = QuestionBank(totalQuestionNo: 50, gameLevel: 1, gameType : "+")
    override func viewDidLoad() {
        super.viewDidLoad()
        //checkQuestionBank()
        nextQuestion()
    }
    
    @IBAction func refreshProblem(_ sender: Any) {
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    //check questions in Bank
    //can be blocked
//    func checkQuestionBank(){
//        for i in (0...totalQuestionNumber - 1) {
//            print ( "\(i))" + " \(bank.questionList[i].questionText)" + "\(bank.questionList[i].calculatedAnswer)" )
//        }
//    }

    
    
    func nextQuestion() {
        if (questionNumber >= totalQuestionNumber){
            questionNumber = 0
            score = 0
            print ("game over")
            nextQuestion()
            
        }else{
            questionLabel.text = bank.questionList[questionNumber].questionText
            userAnswerText.text = ""
            totalQNoLabel.text = "\(questionNumber + 1)" + "/" + "\(totalQuestionNumber)"
            scoreLabel.text = "Score: \(score)"

        }
    }
    
   
    //check user's answer with the system's answer and return bool value
    func checkAnswer(){
        if(userAnswerText.text=="") { userAnswerText.text = "0" }
        if (questionNumber < totalQuestionNumber){
            if (Double(userAnswerText.text!)! == (Double(bank.questionList[questionNumber].calculatedAnswer))){
                score += 1
            }
        }
    }
   
}



