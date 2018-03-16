//
//  main.swift
//  Closures
//
//  Created by Vinicius Luz Souza on 26/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import Foundation

/*
 
 Em swift podemos utilizar funções que solicitam outras funções como parâmetros, como por exemplo o método sorted de um array.
 
 */


// Criando um array de inteiros não ordenados
var arrayInteiros = [9, 7, 5, 3, 2, 10, 7, 1]

// Ordenação usando funçõ

func ordenaArrayInteiros (_ valor1 : Int, _ valor2 : Int) -> Bool {
    return valor1 < valor2
}

var arrayOrdenadoFuncao = arrayInteiros.sorted(by: ordenaArrayInteiros)

print(arrayOrdenadoFuncao)

// ----------------------------------------

/*
 
 Sintaxe de uma closure
 
 {(Parametros) -> Retorno in
    // Comandos para serem executados
 }

 
 */

print("-------- Closure --------")

var ordenacaoClosure = arrayInteiros.sorted { (valor1 : Int, valor2 : Int) -> Bool in
    return valor1 < valor2
}

print(ordenacaoClosure)

// Inferencia de tipo e retorno por contexto

var ordecanaoClosureComInferenciaDeTipoERetornoPorContexto = arrayInteiros.sorted { (valor1, valor2) in
    return valor1 < valor2
}

print(ordecanaoClosureComInferenciaDeTipoERetornoPorContexto)

// Shorthands em argumentos

var ordenacaoClosureUtilizandoShorthands = arrayInteiros.sorted { $0 < $1 }

print(ordenacaoClosureUtilizandoShorthands)

//Inferencia total na closure

var closureInferenciaTotal = arrayInteiros.sorted(by: <)
print(closureInferenciaTotal)

//

func funcaoBoladona (closure : (String, String) -> Bool) -> Bool {
    
    closure("teste", "teste")
    return true
}



