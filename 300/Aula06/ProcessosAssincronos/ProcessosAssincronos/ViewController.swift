//
//  ViewController.swift
//  ProcessosAssincronos
//
//  Created by Vinicius Luz Souza on 05/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var labelCima: UILabel!
    @IBOutlet weak var labelBaixo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    // MARK:- Actions
    @IBAction func iniciar(_ sender: UIButton) {
        var valorCima = 0
        var valorBaixo = 0
        
        sender.isEnabled = false
        
        // Atualizando a label de cima
        DispatchQueue.global().async {
            
            // Utilizando for para simular um processo pesado
            for valor in 11...20 {
                DispatchQueue.main.async {
                    valorCima = valor
                    self.labelCima.text = "\(valor)"
                }
                Thread.sleep(forTimeInterval: 0.7)
            }
            
            if valorBaixo == 15 {
                DispatchQueue.main.async {
                    sender.isEnabled = true
                }
            }
            
        }
        
        // Atualizando a label de baixo
        DispatchQueue.global().async {
            
            for valor in 2...15 {
                DispatchQueue.main.async {
                    valorBaixo = valor
                    self.labelBaixo.text = "\(valor)"
                }
                Thread.sleep(forTimeInterval: 1.0)
            }
            
            if valorCima == 20 {
                DispatchQueue.main.async {
                    sender.isEnabled = true
                }
            }
            
        }
        

    
        
    }
    
    
}

