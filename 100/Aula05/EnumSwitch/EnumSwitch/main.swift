//
//  main.swift
//  EnumSwitch
//
//  Created by Swift on 08/12/2017.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

enum Naipes : String{
    
    case copas = "♥️"
    case espadas = "♠️"
    case ouros = "♦️"
    case paus = "♣️"
}

struct Carta {
    
    var simbolo : String
    var naipe : Naipes
}


var zap = Carta(simbolo: "K", naipe: .copas)


switch zap.naipe {

case .paus:
    print("Eh paus")
    
default:
    print("Pede 6!")
}
