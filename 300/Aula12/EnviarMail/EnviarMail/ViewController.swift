//
//  ViewController.swift
//  EnviarMail
//
//  Created by Vinicius Luz Souza on 14/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável pelo trabalho de envio de mensagens por e-mail ou sms.
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK:- Actions
    @IBAction func enviar(_ sender: UIButton) {
        
        // Verificando se o dispositivo é capaz de enviar mensagens por e-mail. Essa capacidade depende apenas das inscrição do apple id no dispositivo
        if MFMailComposeViewController.canSendMail() {
            
            print("Dispositivo pronto para enviar e-mail")
            
            // Criando o objeto que fará a composição do e-mail
            let compositorMail = MFMailComposeViewController()
            
            // Implementando o delegate
            compositorMail.mailComposeDelegate = self
            
            // Definindo o título do e-mail
            compositorMail.setSubject("Título do e-mail")
            
            // Definindo o corpo do e-mail
            compositorMail.setMessageBody("<b><i>Área destinada ao corpo do e-mail.</i></b>", isHTML: true)
            
            // Definindo os destinatários
            let arrayDestinatarios = ["alguem@algumlugar.com.br", "maisalguem@algumlugar.com.br"]
            compositorMail.setToRecipients(arrayDestinatarios)
            
            // Definindo destinatários com cópia
            let arrayComCopia = ["fulano@algumlugar.com.br", "ciclano@algumlugar.com.br"]
            compositorMail.setCcRecipients(arrayComCopia)
            
            // Definindo destinatários com cópia oculta
            let arrayComCopiaOculta = ["oculto1@algumlugar.com.br", "oculto2@algumlugar.com.br"]
            compositorMail.setBccRecipients(arrayComCopiaOculta)
            
            // Definindo anexos para a mensagem
            let imagem = UIImage(named: "wonder.png")
            let imagemEmBytes = UIImagePNGRepresentation(imagem!)
            compositorMail.addAttachmentData(imagemEmBytes!, mimeType: "image/png", fileName: "mulherMaravilha")
            
            // Apresentando a viewController do compositor
            present(compositorMail, animated: true, completion: nil)
            
            
        } else {
            
            print("Dispositivo incapaz de enviar e-mail")
            
        }
    }

}

// MARK:- Extensão para adoção do protocolo MFMailComposeViewControllerDelegate
extension ViewController : MFMailComposeViewControllerDelegate {
    
    // Método disparado quando os botões enviar ou cancelar são tocados
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
