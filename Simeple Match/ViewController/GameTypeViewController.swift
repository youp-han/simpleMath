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
    
    @IBOutlet weak var difficultiesPickerView: UIPickerView!
    @IBOutlet weak var secmentedControl: UISegmentedControl!
    
    var selectedVar : Int = 0
    let difficulties = ["1","2", "3", "4", "5"]
    
    @IBAction func toCoreViewController(_ sender: Any) {
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "CoreView") as! CoreViewController
        let button = sender as! UIButton
        myVC.bank = QuestionBank(totalQuestionNo: getTotalQuestionNo(), gameLevel: getGameLevel(), gameType : getOpertaionType(button: button.tag))
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

    func getTotalQuestionNo()->Int{
        return 50
    }
    
    func getGameLevel()->Int{
        return selectedVar + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        difficultiesPickerView.delegate = self
        difficultiesPickerView.dataSource = self
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficulties.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difficulties[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedVar = row
        print("row = \(row)")
    }
}
