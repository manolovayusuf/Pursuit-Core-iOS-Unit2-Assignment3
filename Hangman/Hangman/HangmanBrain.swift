//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Manny Yusuf on 11/26/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

var myAlphabet = ["A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z"]

func returnEmpty(userInput: UITextField) -> String {
    //let userWord = Array(userInput.text!) {
        var hiddenWord = ""
        for _ in userInput.text! {
            hiddenWord.append("-")
        }
        return hiddenWord
    }
//}
