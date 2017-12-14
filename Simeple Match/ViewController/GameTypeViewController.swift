//
//  GameTypeViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class GameTypeViewController: UIViewController {

    //desc: Action when the game type button pressed
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
        return 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
