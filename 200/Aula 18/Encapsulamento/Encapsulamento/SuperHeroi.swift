//
//  SuperHeroi.swift
//  Encapsulamento
//
//  Created by Vinicius Luz Souza on 14/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import Foundation

class SuperHeroi {
    var nome : String
    var sobrenome : String
    var idade : Int
    private var identidadeSecreta : String
    
    init() {
        self.nome = ""
        self.sobrenome = ""
        self.idade = 0
        self.identidadeSecreta = ""
    }
    
    func atribuirIdentidadeSecreta(comNomeSecreto identidade : String) {
        self.identidadeSecreta = identidade
    }
    
    func retornarIdentidadeSecreta(gestoSecreto : String) -> String {
        if (gestoSecreto == "figuinhas") {
            return self.identidadeSecreta
        } else {
            return "Ohh meu caro, você deve estar me confundindo!"
        }
    }
    
    func ir(lugar : String) {
        self.voar()
    }
    
    func voar() {
        
    }
    
}
