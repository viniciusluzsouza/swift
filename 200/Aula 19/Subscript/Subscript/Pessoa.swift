//
//  Pessoa.swift
//  Subscript
//
//  Created by Vinicius Luz Souza on 15/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import Foundation

class Pessoa {
    
    var nome : String = ""
    var idade : Int = 0
    private var hobbiesSecretos : [String] = []
    
    func defineHobbiesSecretos(hobbies : [String]) {
        //self.hobbiesSecretos.append(contentsOf: hobbies)
        self.hobbiesSecretos = hobbies
    }
    
    subscript(index : Int) -> String {
        get {
            return self.hobbiesSecretos[index]
        }
        set (novoValor) {
            self.hobbiesSecretos += [novoValor]
        }
    }
    
}
