//
//  ViewController.swift
//  NotificacoesInternas
//
//  Created by Vinicius Luz Souza on 15/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK:- Outlets
    @IBOutlet weak var labelResultado: UILabel!
    
    
    // MARK:- Propriedades
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelResultado.text = ""
        
        // Método que observa a notificação 1
        NotificationCenter.default.addObserver(forName: nomeNotificacao1, object: nil, queue: .main) { (notificacao) in
            
            self.labelResultado.text = "\(notificacao.userInfo![notificacao1]!)"
            
        }
        
        
        // Método que observa a notificação 2
        NotificationCenter.default.addObserver(forName: nomeNotificacao2, object: nil, queue: .main) { (notificacao) in
            
            self.labelResultado.text = "\(notificacao.userInfo![notificacao2]!)"
            
        }
        
    }



}

