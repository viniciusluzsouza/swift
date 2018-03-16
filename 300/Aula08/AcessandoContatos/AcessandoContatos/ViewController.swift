//
//  ViewController.swift
//  AcessandoContatos
//
//  Created by Vinicius Luz Souza on 08/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

import ContactsUI

class ViewController: UIViewController {

    
    // MARK:- Actions
    @IBAction func acessarContatos(_ sender: UIButton) {
        
        let janelaContatos = CNContactPickerViewController()
        
        present(janelaContatos, animated: true, completion: nil)
        
    }
    

}

