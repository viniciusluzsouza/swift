//
//  ViewController.swift
//  NotificacoesInternasTeclado
//
//  Created by Vinicius Luz Souza on 15/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var textFieldSugestoes: UITextField!
    @IBOutlet weak var btnAcessar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnAcessar.layer.cornerRadius = 6
        
        // Observador que escuta quando o teclado está prestes a aparecer na tela
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: .main) { (notificacao) in
            
            if !(self.textFieldSugestoes.isEditing) {
                
                // Captando o tamanho do teclado
                let tamanhoTeclado = (notificacao.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
                
                // Verificando se a view principal está com a sua origem do eixo y intacta
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= tamanhoTeclado!.height
                    print(self.view.frame.origin.y)
                }
                
            }
        
            
        }
        
        // Observador que escuta quando o teclado está prestes a desaparecer da tela
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: .main) { (notificacao) in
            
            // Verificando se a origem do eixo y da view principal está alterada
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
            
        }
        
    }
    
    // MARK:- Métodos de UIResponder
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    
    // MARK:- Método que define a cor dos ícones da status
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK:- Actions


}

