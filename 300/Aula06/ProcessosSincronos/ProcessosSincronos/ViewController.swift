//
//  ViewController.swift
//  ProcessosSincronos
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
        
        // Despachando todo o processo para a fila global
        DispatchQueue.global().async {
            
            //----------------------------
            // Atualizando a label de cima
            DispatchQueue.global().sync {
                for valor in 1...10 {
                    DispatchQueue.main.async {
                        self.labelCima.text = "\(valor)"
                    }
                    Thread.sleep(forTimeInterval: 1.0)
                }
            } // Fechamento do atualizando a label de cima
            //----------------------------
            
            
            //----------------------------
            // Atualizando a label de baixo
            DispatchQueue.global().sync {
                for valor in 11...20 {
                    DispatchQueue.main.async {
                        self.labelBaixo.text = "\(valor)"
                    }
                    Thread.sleep(forTimeInterval: 1.0)
                }
            } // Fechamento do atualizando a label de baixo
            //----------------------------
            
        } // Fechamento do despachando todo o processo para a fila global
        
        
        
    }
    
    

}

