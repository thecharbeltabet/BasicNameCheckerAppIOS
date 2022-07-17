//
//  ViewController.swift
//  NameChecker
//
//  Created by Utilisateur invité on 16/06/2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var secondTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.isHidden = true
    }

    @IBAction func checkComp(_ sender: Any) {
        
       
        
        let name1Length = firstTextField.text?.count ?? 0
        let name2Length = secondTextField.text?.count ?? 0
        
        
        
        if firstTextField.text != "" || secondTextField.text != ""
        {
        
            loader.isHidden = false
            loader.startAnimating()
        let nameDistance = abs(name1Length - name2Length)
        
    
        let biggestLength = max(name1Length,name2Length)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            self.loader.stopAnimating()
            self.loader.isHidden = true
             
            
            let iCompatibility: Int = 100 - Int((Double(nameDistance) / Double(biggestLength)) * 100)
        
            self.percentageLabel.text = String(iCompatibility) + "%"
            
        }
        
        }
        
         
    }
    
}

// MARK: - TextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ firstTextField: UITextField,_ secondTextField: UITextField) -> Bool {
        
        //firstTextField.resignFirstResponder()
        //secondTextField.resignFirstResponder()
         
        
        self.view.endEditing(true)
        
        return true
    }
}

