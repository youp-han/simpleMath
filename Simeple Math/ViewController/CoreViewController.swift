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
            print ("game over")
            alertMessage()
            
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
                bank.questionList[questionNumber].status = 1
                checkQuestionBank()
            }else{
                bank.questionList[questionNumber].status = 0
                checkQuestionBank()
            }
        }
    }
    
    //desc : close self view

    func closeView(){
        navigationController?.popViewController(animated: true)
    }
    
    
    //desc: check questions in Bank
    //can be blocked
    func checkQuestionBank(){
        for i in (0...bank.questionList.count - 1) {
            print ( "\(i))" + " \(bank.questionList[i].questionText)" + "\(bank.questionList[i].calculatedAnswer), \(bank.questionList[i].status)" )
        }
    }

    //desc : To view Results
    func toResultDetailTableViewController() {
        closeView()
        let myVC = storyboard?.instantiateViewController(withIdentifier: "ResultDetailView") as! ResultDetailTableViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    
    //desc: alder Message
    
    func alertMessage() {
        let alertController = UIAlertController(title: "Finished",message: "View Results to View Results \n, Close to Close the current windows", preferredStyle: UIAlertControllerStyle.alert)
        
        //UIAlertActionStye.destructive 지정 글꼴 색상 변경
        let okAction = UIAlertAction(title: "View Results", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
            print("viewresults")
            self.toResultDetailTableViewController()
        }
        
        let cancelButton = UIAlertAction(title: "Close", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
            print("close")
            self.closeView()
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelButton)
        
        self.present(alertController,animated: true,completion: nil)
    }
    
    /*

 @IBAction func ActionSheetRunBtn(_ sender: Any) {
 // 제목 및 메시지 표시 안할 경우 nil지정
 let alert: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle:  UIAlertControllerStyle.actionSheet)
 
 let informantAction: UIAlertAction = UIAlertAction(title: "내용 신고하기", style: UIAlertActionStyle.destructive, handler:{
 (action: UIAlertAction!) -> Void in
 
 print("내용 신고 알림 처리")
 })
 
 let cancelAction: UIAlertAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler:{
 (action: UIAlertAction!) -> Void in
 print("취소처리")
 })
 
 alert.addAction(cancelAction)
 alert.addAction(informantAction)
 
 self.present(alert, animated: true, completion: nil)
 }*/
 
}



