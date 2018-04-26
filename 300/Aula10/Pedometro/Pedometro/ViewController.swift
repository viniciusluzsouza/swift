//
//  ViewController.swift
//  Pedometro
//
//  Created by Vinicius Luz Souza on 12/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var labelPassos: UILabel!
    
    
    // MARK:- Propriedades
    let pedometro = CMPedometer()
    let numeroPassos = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPassos.text = numeroPassos
    }
    
    
    // MARK:- Actions
    @IBAction func iniciar(_ sender: UIButton) {
        
        // Verificando se o dispositivo é capaz de utilizar o sensor
        if CMPedometer.isStepCountingAvailable() {
            
            print("Pedômetro disponível")
            
            // Atualizando os dados na interface. O método utilizado não contém parâmetros para tratar as filas de tarefa. Todos os dados do pedômetro são processados em fila paralela de processos, portanto devemos utilizar um DispatchQueue.main para atualizar a interface
            pedometro.startUpdates(from: Date(), withHandler: { (dados, erros) in
                if erros == nil {
                    DispatchQueue.main.async {
                        self.labelPassos.text = dados?.numberOfSteps.stringValue
                    }
                }
            })
            
        } else {
            print("Pedômetro indisponível")
        }
        
        
    }
    

}

