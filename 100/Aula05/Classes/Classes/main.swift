//
//  main.swift
//  Classes
//
//  Created by Swift on 08/12/2017.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

//Declarando uma Classe

class Pessoa {
    
    //Declarando propriedades
    var nome : String
    var sobrenome : String
    var idade : Int
    var nomeCompleto : String
 
    //Declarando Metodos
    func falar (frase : String){
        
        print("[\(nome)]: ", frase)
    }
    
    init (nome : String, sobrenome : String, idade : Int){
        
        self.nome = nome
        self.sobrenome = sobrenome
        self.nomeCompleto = nome + " " + sobrenome
        self.idade = idade
    }
}

var pessoa = Pessoa(nome: "Esdras", sobrenome: "Martins", idade: 1955)
print(pessoa.nomeCompleto)
pessoa.falar(frase: "E ae galerinha da aula Swift!!!")

