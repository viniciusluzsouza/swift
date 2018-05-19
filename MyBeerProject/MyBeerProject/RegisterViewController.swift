//
//  RegisterViewController.swift
//  MyBeerProject
//
//  Created by Vinicius Luz Souza on 01/05/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var dismissToMain = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buyBeer(_ sender: UIButton) {
        let alertRegister = UIAlertController(title: "Cadastre-se", message: "Preencha os campos a seguir", preferredStyle: .alert)
        
        let registerAction = UIAlertAction(title: "Cadastrar", style: .default) { (action) in
            // Inserir codigo para guardar no banco
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertRegister.addTextField { (textField) in
            textField.autocapitalizationType = .words
            textField.keyboardType = .emailAddress
            textField.placeholder = "Digite seu e-mail"
        }
        
        alertRegister.addTextField { (textField) in
            textField.autocapitalizationType = .words
            textField.placeholder = "Digite sua senha"
            textField.isSecureTextEntry = true
        }
        
        
        alertRegister.addAction(registerAction)
        alertRegister.addAction(cancelAction)
        
        present(alertRegister, animated: true, completion: nil)
    }
    
    @IBAction func sellBeer(_ sender: UIButton) {
        
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
