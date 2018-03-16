//
//  ViewController.swift
//  GCDTratamentoInterface
//
//  Created by Vinicius Luz Souza on 05/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var indicadorAtividade: UIActivityIndicatorView!
    @IBOutlet weak var btnProcessar: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    // MARK:- Actions
    @IBAction func processar(_ sender: UIButton) {
        indicadorAtividade.startAnimating()
        btnProcessar.isEnabled = false
        
        // Despachando a tarefa para a fila paralela
        DispatchQueue.global().async {
            
            // O for está sendo utilizado para simular um processo pesado
            for processo in 1...5 {
                
                if processo == 5 {
                    
                    // Retornando a fila principal para alterar os elementos de interface
                    DispatchQueue.main.async {
                        self.indicadorAtividade.stopAnimating()
                        self.btnProcessar.isEnabled = true
                    }
                }
                
                print("Processando \(processo)")
                Thread.sleep(forTimeInterval: 1.0)
            }
        }
        
        DispatchQueue.global().async {
         
            while (true) {
                print("OI")
                Thread.sleep(forTimeInterval: 1.0)
            }
            
        }
        
        DispatchQueue.global().async {
            
            while (true) {
                print("Tchau")
                Thread.sleep(forTimeInterval: 1.0)
            }
            
        }
        
        
    }
    
    

}

