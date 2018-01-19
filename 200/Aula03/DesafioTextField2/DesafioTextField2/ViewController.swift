//
//  ViewController.swift
//  DesafioTextField2
//
//  Created by Vinicius Luz Souza on 18/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet weak var lbCaracteres: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var segmentedLimitar: UISegmentedControl!
    
    // MARK: - Propriedades
    var limitar : Bool = false
    var chars : Int = 0
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myTextField.placeholder = "Digite até 128 caracteres."
        
        if (self.segmentedLimitar.selectedSegmentIndex == 0) {
            self.limitar = true
        } else {
            self.limitar = false
        }
        
        self.lbCaracteres.text = "128 caracteres restantes."
        self.myTextField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func limitar(_ sender: UISegmentedControl) {
        if (self.segmentedLimitar.selectedSegmentIndex == 0) {
            self.limitar = true
        } else {
            self.limitar = false
        }
    }
    
    // MARK: - Métodos
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        
        var last = false
        var retorno = false
        
        if (isBackSpace == -92) {
            if (self.chars == 129) {
                last = true
                retorno = self.textFieldShouldBeginEditing(myTextField)
            }
            self.chars -= 1
        } else {
            self.chars += 1
        }
        
        var restante = 0
        if (self.chars <= 128) {
            restante = 128 - self.chars
        } else {
            restante = 0
        }
        self.lbCaracteres.text = "\(restante) caracteres restantes."
        
        if last {
            return retorno
        }
    
        if self.limitar {
            return self.textFieldShouldBeginEditing(myTextField)
        } else {
            return true
        }
        

    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (self.chars > 128) {
            return false
        }
        return true
    }

}

