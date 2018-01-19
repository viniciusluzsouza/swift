//
//  main.swift
//  Enums
//
//  Created by Swift on 08/12/2017.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation


enum PontosCardeais {
    
    case norte
    case sul
    case leste
    case oeste
    
}

print(PontosCardeais.norte)

enum Nota : Int {
    
    case semNota = 0
    case pessimo = 2
    case regular = 4
    case bom = 6
    case muitoBom = 8
    case top = 10
    
}

struct Aluno {
    
    var nome : String
    var curso : String
    var notaFinal : Nota
}


var aluno01 = Aluno(nome: "Esdras", curso: "Swift", notaFinal: .bom)
var aluno02 = Aluno(nome: "Joaozinho", curso: "Java", notaFinal: Nota.muitoBom)
var aluno03 = Aluno(nome: "Pedrinho", curso: "C#", notaFinal: Nota(rawValue: 2)!)

print("========")
print(aluno01.notaFinal)
print("hashValue ", aluno01.notaFinal.hashValue)
print("rawValue", aluno01.notaFinal.rawValue)
