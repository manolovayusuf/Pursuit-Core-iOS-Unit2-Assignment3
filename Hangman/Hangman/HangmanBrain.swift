//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Manny Yusuf on 11/26/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


var chances = 6
class HangManBrain {
    
    var myAlphabet = ["A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z"]
    //var guesses = 6
    // var usedLetters = [Character]()
    var rightLetters = [String]()
    func returnEmpty(userInput: String) -> String {
        let guessedLetters = userInput.map { _ in return "-" }
        rightLetters = guessedLetters
        return guessedLetters.reduce("", +)
    }
    func checkForWord(myArray: [String], typedWord: String) -> String {
        for (index, letter) in myArray.enumerated() {
            if letter == typedWord {
                rightLetters[index] = letter
            }
        }
        return rightLetters.reduce("", +)
    }
    
    func myImage(myInt: Int) -> UIImage {
        return hangmanImage.allPictures.filter{$0.number == myInt}[0].image
    }
}
