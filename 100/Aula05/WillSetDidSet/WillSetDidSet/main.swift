//
//  main.swift
//  WillSetDidSet
//
//  Created by Swift on 08/12/2017.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

class Carro {
    
    var modelo : String {
        
        willSet(novoValor){
            
            print("willSet")
            print("Alterando o valor")
        }
        
        didSet{
    
            print("didSet")
            print("valor antigo \(oldValue)")
        }
    }
    
    init(modelo : String){
        
        self.modelo = modelo
    }
}



var carrinho = Carro(modelo: "Gol bolinha")
carrinho.modelo = "Fusca"
