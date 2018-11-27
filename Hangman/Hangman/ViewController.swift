//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var secureTextField: UITextField!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var hangMan: UILabel!
    @IBOutlet weak var hangManPicture: UIImageView!
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        secureTextField.delegate = self
        userInput.delegate = self
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        secureTextField.resignFirstResponder()
        userInput.resignFirstResponder()
        hangMan.text = returnEmpty(userInput: textField )
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "")
        return true
    }
}
