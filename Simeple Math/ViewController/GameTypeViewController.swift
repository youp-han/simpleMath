//
//  GameTypeViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class GameTypeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    @IBOutlet weak var practiceLevelPickerView: UIPickerView!
    @IBOutlet weak var subLevelPickerView: UIPickerView!
    @IBOutlet weak var numberOfQuestionsPckerView: UIPickerView!
    
    
    var selectedVarForPracticeLevels : Int = 0
    var selectedVarForSubLevels : Int = 0
    var selectedVarForNoOfQuestions : Int = 0

    let practiceLevel = ["1","2", "3", "4", "5"]
    let sublevels = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let noOfQuestions = ["10", "25", "50", "100"]
    
    @IBAction func toCoreViewController(_ sender: Any) {
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "CoreView") as! CoreViewController
        let button = sender as! UIButton
        myVC.bank = QuestionBank(practiceLevel: getPracticeLevel(), sublevel : getSubLevel(), noOfQuestions: getTotalQuestionNo(), gameType : getOpertaionType(button: button.tag))
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    
    func getOpertaionType(button tag:Int)->String {
        switch (tag){
        case 0: return "+"
        case 1: return "-"
        case 2: return "*"
        case 3: return "/"
        default: return "something went wrong"
        }
    }

    
    func getPracticeLevel()->Int{
        return Int(practiceLevel[selectedVarForPracticeLevels])!
    }
    
    func getSubLevel()->Int{
        return Int(sublevels[selectedVarForSubLevels])!
    }
    
    func getTotalQuestionNo()->Int{
        return Int(noOfQuestions[selectedVarForNoOfQuestions])!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegate()
        self.pickerViewDefault()
        
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setDelegate(){
        practiceLevelPickerView.delegate = self
        practiceLevelPickerView.dataSource = self
        subLevelPickerView.delegate = self
        subLevelPickerView.dataSource = self
        numberOfQuestionsPckerView.delegate = self
        numberOfQuestionsPckerView.dataSource = self
    }
    
    //pickerView
    func pickerViewDefault() {
        let row : Int = 0
        let comp : Int = 0
        practiceLevelPickerView.selectRow(row, inComponent: comp, animated: true)
        subLevelPickerView.selectRow(row, inComponent: comp, animated: true)
        numberOfQuestionsPckerView.selectRow(row + 1, inComponent: comp, animated: true)
        
        pickerView(practiceLevelPickerView, didSelectRow: 1, inComponent: 0)
        pickerView(numberOfQuestionsPckerView, didSelectRow: 1, inComponent: 0)
        pickerView(numberOfQuestionsPckerView, didSelectRow: 1, inComponent: 0)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == practiceLevelPickerView){
            return practiceLevel.count
        } else if(pickerView == subLevelPickerView){
            return sublevels.count
        } else {
            return noOfQuestions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (pickerView == practiceLevelPickerView){
            return practiceLevel[row]
        } else if(pickerView == subLevelPickerView){
            return sublevels[row]
        } else {
            return noOfQuestions[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == practiceLevelPickerView){
            return 1
        } else if(pickerView == subLevelPickerView){
            return 1
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView == practiceLevelPickerView){
            selectedVarForPracticeLevels = row
            print("selectedVarForDifficulties row = \(row)")
        } else if(pickerView == subLevelPickerView){
            selectedVarForSubLevels = row
            print("selectedVarForSubLevels row = \(row)")
        } else {
            selectedVarForNoOfQuestions = row
            print("selectedVarForNoOfQuestions row = \(row)")
        }
    }
}
