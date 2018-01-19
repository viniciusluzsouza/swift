//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Optionals - São variáveis que potencialmente podem conter o valor nulo, são particularmentes úteis para receber resultados de expressões com esta possibilidade.

//Variavel comum
var variavelComum : Int = 10
print(variavelComum)

//Variavel optional
var variavelOptional : Int? = 50
print(variavelOptional)

variavelOptional = nil
print(variavelOptional)

//Atribuindo variável comum para uma optional
var variavelComum2 : Int = 30
var variavelOptional2 : Int? = variavelComum2

print(variavelComum2)
print(variavelOptional2)

//Atribuindo uma variavel optional para uma variavel comum

var variavelOptional3 : Int? = 42
var variavelComum3 : Int = variavelOptional3!
print(variavelComum3)

var dicionario = ["Calabresa" : 65.0]
print(dicionario["Calabresa"])


var resultado = variavelComum + variavelOptional3!

