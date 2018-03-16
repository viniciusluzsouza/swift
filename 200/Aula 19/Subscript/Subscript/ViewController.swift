//
//  ViewController.swift
//  Subscript
//
//  Created by Vinicius Luz Souza on 15/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var pessoinha = Pessoa()
        pessoinha.nome = "Dexter"
        pessoinha.idade = 25
        
        var arrayHobbies = ["Afiar facas", "Desossar carcaças", "Fazer bolo"]
        
        pessoinha.defineHobbiesSecretos(hobbies: arrayHobbies)
        
        print("\(pessoinha[0])")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

