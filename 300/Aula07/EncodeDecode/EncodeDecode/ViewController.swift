//
//  ViewController.swift
//  EncodeDecode
//
//  Created by Vinicius Luz Souza on 07/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// MARK:- Estrutura SandBox
let caminhoRaiz = NSHomeDirectory()
let caminhoDocuments = (caminhoRaiz as NSString).appendingPathComponent("Documents")
let caminhoArquivoJSON = (caminhoDocuments as NSString).appendingPathComponent("meusDados.json")

class ViewController: UIViewController {
    
    // MARK:- Propriedades
    var umEndereco : Endereco!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Traduzindo um arquivo JSON com o Decode
        let caminhoArquivo = Bundle.main.url(forResource: "cep", withExtension: "json")
        let decodificador = JSONDecoder()
        
        let enderecoExtraido = try! decodificador.decode(Endereco.self, from: Data(contentsOf: caminhoArquivo!))
        
        //print(enderecoExtraido)
        print(enderecoExtraido.cep)
        print(enderecoExtraido.logradouro)
        
        
        // Exportar para JSON com o Encode
        print(caminhoDocuments)
        
        umEndereco = Endereco(cep: "01418100", logradouro: "Alameda Santos")
        let codificador = JSONEncoder()
        let novoJSON = try! codificador.encode(umEndereco)
        let dataParaGravar = novoJSON as NSData
        
        dataParaGravar.write(toFile: caminhoArquivoJSON, atomically: true)
        
    }



}

