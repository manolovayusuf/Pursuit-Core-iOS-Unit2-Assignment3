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
    @IBOutlet weak var guessedLetters: UILabel!
    @IBOutlet weak var correctGuesses: UILabel!
    
    
    var usedLetters = ""
    var hangManBrain: HangManBrain = HangManBrain()
    var newWordArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secureTextField.delegate = self
        userInput.delegate = self
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        secureTextField.text = ""
        userInput.isHidden = true
        chances = 6
        hangMan.text = "You have: \(chances) chances left"
        hangManPicture.image = hangManBrain.myImage(myInt: chances)
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        if textField == secureTextField {
            userInput.isHidden = false
        newWordArray = textField.text!.map{String($0)}
        let secureWord = hangManBrain.returnEmpty(userInput: secureTextField.text!)
        correctGuesses.text = "\(secureWord)"
      
        
        }
        var winning = false
        if textField == userInput {
            guard let count = userInput.text?.count, count == 1
                    else {
                        hangMan.text = "You can only guess one letter"
                        return false 
                    }
            let letterGuess = hangManBrain.checkForWord(myArray: newWordArray, typedWord:
                userInput.text!)
                correctGuesses.text = "\(letterGuess)"
            let wrongLetter = !letterGuess.contains(Character(userInput.text!))
            if wrongLetter {
                 chances -= 1
               hangManPicture.image = hangManBrain.myImage(myInt: chances)
                  usedLetters.append(userInput.text!)
           guessedLetters.text = "\(usedLetters)"
            }
            if !letterGuess.contains("-") {
                winning = true
            }
            hangMan.text = "You have: \(chances) chances left"
            if chances == 0 {
                hangMan.text = "Wanna play a new game?"
                }
            }
        if winning == true {
            userInput.isHidden = true
            hangMan.text = "You've Won!!!"
           hangMan.isHidden = false
         return false
        }
                userInput.text = ""
         textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return true
    }
}
