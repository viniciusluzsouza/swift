//
//  ViewController.swift
//  TrabalhandoSMS
//
//  Created by Vinicius Luz Souza on 15/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textViewMensagem: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewMensagem.text = ""
        
    }
    
    // MARK:- Actions
    @IBAction func enviar(_ sender: UIButton) {
        
        // Verificando se o dispositivo é capaz de enviar mensagens SMS
        if MFMessageComposeViewController.canSendText() {
            print("Dispositivo pronto para enviar mensagens SMS")
            
            // Verificando se os campos estão preenchidos
            if !(textFieldTelefone.text!.isEmpty || textViewMensagem.text.isEmpty) {
                
                // Criando o objeto que irá compor a mensagem SMS
                let compositorSMS = MFMessageComposeViewController()
                
                // Implementando o protocolo delegate
                compositorSMS.messageComposeDelegate = self
                
                // Definindo os destinatários
                compositorSMS.recipients = [textFieldTelefone.text!]
                
                // Definindo o corpo da mensagem
                compositorSMS.body = textViewMensagem.text!
                
                // Apresentando o VC de mensagem SMS
                present(compositorSMS, animated: true, completion: nil)
                
            } else {
                let alerta = UIAlertController(title: "Alerta", message: "Preencha os campos corretamente", preferredStyle: .alert)
                let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
                alerta.addAction(acaoOK)
                present(alerta, animated: true, completion: nil)
            }
            
        } else {
            print("Dispositivo não pode enviar mensagens SMS")
        }
        
    }
    
    
    // MARK:- Métodos de UIResponder
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }


}

// MARK:- Extensão para adoção do protocolo MFMessageComposeViewControllerDelegate
extension ViewController : MFMessageComposeViewControllerDelegate {
    
    // Método disparado quando a janela de mensagens é finalizada
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        controller.dismiss(animated: true, completion: nil)
        
        
    }
    
}
