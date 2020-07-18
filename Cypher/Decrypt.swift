//
//  Decrypt.swift
//  Cypher
//
//  Created by Lukas Weber on 18.07.20.
//  Copyright © 2020 Lukas Weber. All rights reserved.
//

import UIKit

class Decrypt: UIViewController {
    
    @IBOutlet weak var userEnteredText: UITextField!
    @IBOutlet weak var rotationTxtField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var decryptLabel: UILabel!
    
    var userText = ""
    var asciiNumber = true
    
    @IBAction func decryptButton(_ sender: Any) {
        
          if (userEnteredText.text != "" && rotationTxtField.text != "") {
        if (userEnteredText.text?.count != 0) {
            outputLabel.isHidden = false
            userText = userEnteredText.text!
            decryptCode(userEnteredText: userText, rotation: UInt8(Int(rotationTxtField.text!)!))
            decryptLabel.isHidden = false
        }
        } else if (userEnteredText.text == "" && rotationTxtField.text == "") {
            outputStuff(text: "Fill both fields", color: .red)
          } else if (userEnteredText.text == "") {
            outputStuff(text: "Enter a text", color: .red)
          } else if (rotationTxtField.text == "") {
            outputStuff(text: "Enter a number", color: .red)
        }
        
    }
    
    func decryptCode(userEnteredText: String, rotation: UInt8) {
            
        print(userEnteredText.count)
       var c = ""
        for i in (0..<userEnteredText.count) {
            if (userEnteredText.charAt(at: i).isASCII) {
             let asciiWithRotation = userEnteredText.charAt(at: i).asciiValue! - rotation
            
            if(userEnteredText.charAt(at: i).isUppercase) {
                
                let f = Character(UnicodeScalar(90 - ((90 - asciiWithRotation) % 26)))
                c.append(f)
            } else if (userEnteredText.charAt(at: i).isLowercase) {
                let f = Character(UnicodeScalar(122 - (122 - asciiWithRotation) % 26))
                c.append(f)
            } else if (userEnteredText.charAt(at: i).isNumber) {
                let f = Character(UnicodeScalar(57 - ((57 - asciiWithRotation) % 10)))
                c.append(f)
            } else {
                c.append(userEnteredText.charAt(at: i))
            }
            } else {
                outputStuff(text: "No umlauts allowed", color: .red)
//                outputLabel.isHidden = false
//                outputLabel.text = "No umlauts allowed!"
//                outputLabel.textColor = UIColor.red
                asciiNumber = false
//                print("ABX")
            }
        }
        if (asciiNumber) {
                outputLabel.text = c
                outputLabel.textColor = UIColor.black
        print(outputLabel.text!)
            }
    }
    
    func outputStuff(text: String, color: UIColor) {
        outputLabel.isHidden = false
        outputLabel.text = text
        outputLabel.textColor = color
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
}
