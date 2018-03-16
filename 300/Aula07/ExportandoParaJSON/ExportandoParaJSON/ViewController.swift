//
//  ViewController.swift
//  ExportandoParaJSON
//
//  Created by Vinicius Luz Souza on 07/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// MARK:- Estrutura SandBox
let caminhoRaiz = NSHomeDirectory()
let caminhoDocuments = (caminhoRaiz as NSString).appendingPathComponent("Documents")
let caminhoArquivo = (caminhoDocuments as NSString).appendingPathComponent("meusDados.json")

class ViewController: UIViewController {
    
    let dic1 = ["nome" : "Maria", "idade" : "35"]
    let dic2 = ["nome" : "Joaquim", "idade" : "29"]

    var arrayLista : [[String : String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        print(caminhoDocuments)
        
        arrayLista.append(dic1)
        arrayLista.append(dic2)
        
        let dataJSON = try! JSONSerialization.data(withJSONObject: arrayLista, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let dadosParaGravar = dataJSON as NSData
        
        dadosParaGravar.write(toFile: caminhoArquivo, atomically: true)
        
    }



}

