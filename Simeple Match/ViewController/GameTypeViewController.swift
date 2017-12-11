//
//  GameTypeViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 8..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class GameTypeViewController: UIViewController {

    
    
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
