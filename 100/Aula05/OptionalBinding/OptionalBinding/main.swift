//
//  main.swift
//  OptionalBinding
//
//  Created by Swift on 08/12/2017.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation


let numeroDaCasaString = "+555"
let numeroDaCasaInt = Int(numeroDaCasaString)

print(numeroDaCasaInt)

//----------------------------
//Forced Unwrapping
var cpf : Int? = nil
print(cpf)


//--------------------------

if Int(numeroDaCasaString) == nil{
    
    print("Não consegui converter o numero da casa em Int")
}else{
    
    let numeroEmInt = Int(numeroDaCasaString)!
    print(numeroEmInt)
}


//---------------------------------
//------- Optional Binding --------
//---------------------------------
let numeroCasaConvertido = Int(numeroDaCasaString)



if let numeroCasaConvertido = Int(numeroDaCasaString){
    
    print("Numero convertido \(numeroCasaConvertido)")
    print(numeroCasaConvertido)
    
    
}else{
    
    print("Deu ruim a conversão")
}

var erro : String?

if let _ = erro{
    
    print("Requisição com erro")
    
}else{
    
    print("Funcionou tudo direitinho")
}

var erro2 : String? = "ERROR 404"

if let qualErro = erro{
    
    print("Está com erro \(qualErro)")
    print(qualErro)
    
}else{
    
    print("Tudo funcionando")
}



//---------------------
// Nil Coalescing Operator (??)
//
//sintaxe
//
// checagemDeValorOptional ?? valorDefault
//---------------------



var numeroA : Int? = nil
var numeroB : Int = 10

let numeroC = numeroA ?? 0

print("Numero C \(numeroC)")


//-----------------------------
//Implicity Unwrapped Optionals
//-----------------------------

var nome: String!
//nome = nil //Esse cara explode
nome = "Joaozinho"
var nomeNaoOptional : String = nome
print("Unwrapped Optionals: ", nomeNaoOptional)


//==============
var nome2 : String? = "Esdras"
print("Unwrapped com o operador: ", nome2 ?? "Jhon Doe" )



