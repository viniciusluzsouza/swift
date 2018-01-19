//
//  main.swift
//  OptionalChaining
//
//  Created by Swift on 08/12/2017.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

struct Pessoa{
    
    var nome : String
    var rg : RG?
    
}

struct RG{
    
    var numero : Int
    var emissor : String?
    var dataEmissao : String
    
    func trocarFoto(){
        print("Foto trocada com sucesso!")
    }
}



let pessoinha = Pessoa(nome: "Esdras", rg: RG(numero: 22233344, emissor: nil, dataEmissao: "05.05.2005"))

print(pessoinha.rg?.numero)



struct Telefones{
    
    var residencial : String = "0000-0000"
    var celular : String = "99989-9999"
}

struct Cliente{
    
    var nome : String?
    var contatosTelefonicos : Telefones?
}




var clienteNovo = Cliente(nome: "Esdras", contatosTelefonicos: Telefones(residencial: "5555-5555", celular: "91232-1212"))




if let telefoneResidencial = clienteNovo.contatosTelefonicos?.residencial{
    
    print("Liga 9 am \(telefoneResidencial)")
    
}else{
    
    print("Telefone não disponível")
}
