//
//  ViewController.swift
//  Cypher
//
//  Created by Lukas Weber on 16.07.20.
//  Copyright © 2020 Lukas Weber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var decryptButton: UIButton!
    
    @IBOutlet weak var encryptDesignButton: UIButton!
    @IBAction func encryptButton(_ sender: UIButton) {
//   let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! Encrypt
//        present(vc, animated: true)
//
    }
    
    @IBAction func decryptButton(_ sender: UIButton) {
//        let tvc = storyboard?.instantiateViewController(withIdentifier: "thirdVC") as! Decrypt
//               present(tvc, animated: true)
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.setUpBackgroundGradientLayer(colorOne: UIColor.gray, colorTwo: UIColor.white)
        encryptDesignButton.setUpBackgroundGradientLayer(colorOne: UIColor.blue, colorTwo: UIColor.white)
        decryptButton.setUpBackgroundGradientLayer(colorOne: UIColor.white, colorTwo: UIColor.blue)
    }


}


extension UIView {
    func setUpBackgroundGradientLayer(colorOne: UIColor, colorTwo: UIColor) {
          let gradientLayer = CAGradientLayer()
          gradientLayer.frame = bounds
          gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
          gradientLayer.startPoint = CGPoint(x: 0, y: 0)
          gradientLayer.endPoint = CGPoint(x: 1, y: 1)
          layer.insertSublayer(gradientLayer, at: 0)
      }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }

       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
}
