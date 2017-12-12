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
        
        print("\(button.tag)")
        
        switch (button.tag){
        case 0: myVC.systemOperationType = "+"
        case 1: myVC.systemOperationType = "-"
        case 2: myVC.systemOperationType = "*"
        case 3: myVC.systemOperationType = "/"
        default: print("something went wrong")
        }
        
        myVC.gameLevel = 1
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
