//
//  Classe.swift
//  EncodeDecode
//
//  Created by Vinicius Luz Souza on 07/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import Foundation

// O protocolo Codable adiciona a uma struct ou class, a capacidade de Incorporar ou externar dados no formato JSON

struct Endereco : Codable {
    
    // Propriedades
    var cep : String
    var logradouro : String
    
}
