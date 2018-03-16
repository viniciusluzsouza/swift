//
//  ViewController.swift
//  GCDSimples
//
//  Created by Vinicius Luz Souza on 05/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

/* ---------- Glossário ----------
 
 - GCD: Grand Central Dispatch - UM local em memória onde ficam armazenadas as filas de um processo.
 
 - Queue: é uma fila de processos
 
 - Main Queue: é a fila principal de processos. É nela que são processados todos os blocos que desenvolvemos e toda a interface gráfica.
 
 - Global Queue: é a fila paralela de processos. Pode ser acessada sempre que houver a necessidade de tirar um processo da fila principal.
 
 - Threads: São tarefas. Cada tarefa é indicada por um bloco de execução ({})
 
 - Sync: Indica processos síncronos, onde uma tarefa só pode ser executada depois que outra tarefa que está na mesma fila for encerrada.
 
 - Assync: Indica processos assíncronos, onde cada tarefa é independentede qualquer outra tarefa.
 
 
*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK:- Actions
    @IBAction func processarPrincipal(_ sender: UIButton) {
        
        for processoA in 1...5{
            print("Processando A \(processoA)")
            Thread.sleep(forTimeInterval: 1.0)
        }
        
    }
    
    @IBAction func processarParalela(_ sender: UIButton) {
        
        //Despachando uma tarefa para a fila paralela de processos
        DispatchQueue.global().async {
            
            // Estamos dentro de uma closure. Qualquer referencia feita dentro de uma closure DEVE conter o self na frente
            for processoB in 1...5{
                print("Processando B \(processoB)")
                Thread.sleep(forTimeInterval: 1.0)
            }
            
        }
        
        
    }
    
    
    

}

