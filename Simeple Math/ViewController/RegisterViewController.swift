//
//  RegisterViewController.swift
//  Simeple Match
//
//  Created by mike han on 2017. 12. 12..
//  Copyright © 2017년 mike han. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var gender: UISegmentedControl!
    
    var initiateMsg : String = "이름 과 나이를 입력 후 저장 버튼을 눌러주세요"
    
    var saveMsg : String = "저장되었습니다. "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!checkRegisteredUser()){
            infoTextView.text = initiateMsg
        }else{
            greetReturnUser()
        }
    }
    
    func checkRegisteredUser()->Bool{
        return false
    }
    
    func greetReturnUser(){
        let name : String = "mike"
        let age : Int = 8
        infoTextView.text = "\(name)님, 안녕하세요 "
        nameText.text = name
        ageText.text = String(age)
    }

    
    @IBAction func save(_ sender: Any) {
        infoTextView.text = saveMsg + "\(String(nameText.text!))" + " 님, 등록 해 주셔서 감사합니다. "
        
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
