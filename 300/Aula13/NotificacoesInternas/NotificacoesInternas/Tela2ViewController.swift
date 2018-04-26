//
//  Tela2ViewController.swift
//  NotificacoesInternas
//
//  Created by Vinicius Luz Souza on 15/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    // MARK: - Actions
    @IBAction func dispararNot1(_ sender: UIButton) {
        
        // Método que postará a notificação 1
        NotificationCenter.default.post(name: nomeNotificacao1, object: nil, userInfo: [notificacao1 : "Disparou notificação 1"])
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func dispararNot2(_ sender: UIButton) {
        
        // Método que postará a notificação 2
        NotificationCenter.default.post(name: nomeNotificacao2, object: nil, userInfo: [notificacao2 : "Disparou notificação 2"])
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
