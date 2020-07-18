//
//  SecondViewController.swift
//  Cypher
//
//  Created by Lukas Weber on 16.07.20.
//  Copyright © 2020 Lukas Weber. All rights reserved.
//

import UIKit

class Encrypt: UIViewController {
    
    @IBOutlet weak var userEnteredText: UITextField!
    @IBOutlet weak var rotationTxtField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var encryptedLabel: UILabel!
    
    
    var userText = ""
    var asciiNumber = true
    
    
    @IBAction func encryptButton(_ sender: UIButton) {
        
        if (userEnteredText.text != "" && rotationTxtField.text != "") {
        
            if (userEnteredText.text?.count != 0) {
            outputLabel.isHidden = false
            userText = userEnteredText.text!
            encryptCode(userEnteredText: userText, rotation: UInt8(Int(rotationTxtField.text!)!))
            encryptedLabel.isHidden = false
            }
        } else if (userEnteredText.text == "" && rotationTxtField.text == "") {
            outputStuff(text: "Fill both fields", color: .red)
        } else if (userEnteredText.text == "") {
            outputStuff(text: "Enter a text", color: .red)
        } else if (rotationTxtField.text == "") {
            outputStuff(text: "Enter a number", color: .red)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        userText = userEnteredText.text!
        
        
    }
    
    func outputStuff(text: String, color: UIColor) {
        outputLabel.isHidden = false
        outputLabel.text = text
        outputLabel.textColor = color
        
    }
    
    func encryptCode(userEnteredText: String, rotation: UInt8) {
            
        print(userEnteredText.count)
       var c = ""
        for i in (0..<userEnteredText.count) {
            if (userEnteredText.charAt(at: i).isASCII) {
             let asciiWithRotation = userEnteredText.charAt(at: i).asciiValue! + rotation
            if(userEnteredText.charAt(at: i).isUppercase) {
                
                let f = Character(UnicodeScalar((asciiWithRotation - 65) % 26 + 65))
                c.append(f)
            } else if (userEnteredText.charAt(at: i).isLowercase) {
                let f = Character(UnicodeScalar((asciiWithRotation - 97) % 26 + 97))
                c.append(f)
            } else if (userEnteredText.charAt(at: i).isNumber) {
                print(asciiWithRotation % 10 + 48)
                let f = Character(UnicodeScalar((asciiWithRotation - 48) % 10 + 48))
                c.append(f)
            } else {
                c.append(userEnteredText.charAt(at: i))
            }
            } else {
                outputLabel.isHidden = false
                               outputLabel.text = "No umlauts allowed!"
                               outputLabel.textColor = UIColor.red
                               asciiNumber = false
                               print("ABX")
            }
                }
        if (asciiNumber) {
                outputLabel.text = c
                outputLabel.textColor = UIColor.black
        }
            }
    
    }

extension String {
    func charAt(at: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: at)
        return self[charIndex]
    }
}
