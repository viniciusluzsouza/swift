//
//  main.swift
//  Heranca
//
//  Created by Swift on 08/12/2017.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation


class Pessoa {
    
    
    //Declarando propriedades
    var nome : String
    var idade : Int
    
    init(nome : String, idade : Int){
        
        self.nome = nome
        self.idade = idade
        
    }
    
    func falar(frase : String){
        
        print("[\(nome)]: ", frase)
    }
    
    //Nao permite especializacao
    final func andar(){
        print("andando...")
    }

    //Funcao que não precisa de uma instancia para ser chamada
    static func funcaoEstatica (){
        print("Sou uma funcao estática")
    }
}

class Aluno : Pessoa {
    
    var curso : String
    
    init(curso : String, nome : String, idade : Int){
        
        self.curso = curso
        super.init(nome: nome, idade: idade)
    }
    
    override func falar(frase: String) {
        
        print("Hey! \(frase)")
    }

    func copiar(){
        print("Copiando a materia")
    }
}

class Instrutor : Pessoa {
    
    var materias : [String]
    
    init(materias : [String], nome : String, idade : Int){
        
        self.materias = materias
        
        super.init(nome: nome, idade: idade)
        
    }
    
    override func falar(frase: String) {
        
        print("Falaaa galerinha! ")
    }
}

class Escola{
    
    var instrutores : [Instrutor] = []
    var alunos : [Aluno] = []
    
}


var pessoa01 : Pessoa = Pessoa(nome: "Pedrinho", idade: 22)
pessoa01.falar(frase: "Eh pra copiar professor?")
print(pessoa01.idade)

var aluno01 : Aluno = Aluno(curso: "Swift", nome: "Joaozinho", idade: 25)
aluno01.falar(frase: "Eh pra copiar professor?")
aluno01.copiar()

var instrutor01 : Instrutor = Instrutor(materias: ["Swift", "Objective-C", "Git"], nome: "Galribaldo", idade: 27)
instrutor01.falar(frase: "Boa noite pessoal!")
print(instrutor01.materias)

var pessoalDaEscola = [pessoa01, aluno01, instrutor01]

print("====================")
for p in pessoalDaEscola {
    
    p.falar(frase: "Frase parametro")
}




