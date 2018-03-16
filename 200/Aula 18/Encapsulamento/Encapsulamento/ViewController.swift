//
//  ViewController.swift
//  Encapsulamento
//
//  Created by Vinicius Luz Souza on 14/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pessoaComum = SuperHeroi()
        pessoaComum.nome = "Clark"
        pessoaComum.sobrenome = "Kent"
        pessoaComum.idade = 28
        pessoaComum.atribuirIdentidadeSecreta(comNomeSecreto: "Superman")
        
        let ident = pessoaComum.retornarIdentidadeSecreta(gestoSecreto: "figuinhas")
        print(ident)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

