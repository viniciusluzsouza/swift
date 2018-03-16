//
//  ViewController.swift
//  TrabalhandoDadosJSON
//
//  Created by Vinicius Luz Souza on 07/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var textViewResultado: UITextView!
    
    
    // MARK:- Propriedades
    var arrayLista : [[String : String]] = []
    var caminhoArquivo = Bundle.main.url(forResource: "dados", withExtension: "json")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewResultado.text = ""
    }
    
    
    // MARK:- Actions
    @IBAction func exibirDados(_ sender: UIButton) {
        
        // Um objeto do tipo Data, armazena qualquer tipo de arquivo. Basicamente os dados do arquivo são transformados em números binários. Nesse caso todos os dados contidos em um objeto Data esão em bytes.
        let dadosData = try! Data(contentsOf: caminhoArquivo!)
        
        var stringResultado = ""
        
        // Traduzindo os dados do JASON
        do {
            arrayLista = try JSONSerialization.jsonObject(with: dadosData, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String : String]]
            print("JSON traduzido com sucesso")
            print(arrayLista)
        } catch {
            print("Erro: \(error.localizedDescription)")
        }
        
        for dado in arrayLista {
            if dado["nome"] != nil  && dado["idade"] != nil {
                stringResultado += "Nome: \(dado["nome"]!)\nIdade: \(dado["idade"]!)\n\n"
            }
        }
        
        textViewResultado.text = stringResultado
        
    }
    


}

