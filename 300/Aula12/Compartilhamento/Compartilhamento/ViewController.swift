//
//  ViewController.swift
//  Compartilhamento
//
//  Created by Vinicius Luz Souza on 14/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var textFieldURL: UITextField!
    @IBOutlet weak var textFieldTexto: UITextField!
    @IBOutlet weak var imageWW: UIImageView!
    
    
    // MARK:- Propriedades
    var compartilhador : UIActivityViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // MARK:- Actions
    @IBAction func compartilharURL(_ sender: UIButton) {
        
        if !(textFieldURL.text!.isEmpty) {
            
            let enderecoURL = URL(string: "http://\(textFieldURL.text!)")
            compartilhador = UIActivityViewController(activityItems: [enderecoURL!], applicationActivities: nil)
            present(compartilhador, animated: true, completion: nil)
            
        } else {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo texto corretamente", preferredStyle: .alert)
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(acaoOK)
            present(alerta, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func compartilharTexto(_ sender: UIButton) {
        
        if !(textFieldTexto.text!.isEmpty) {
            
            let textoInformado = textFieldTexto.text!
            compartilhador = UIActivityViewController(activityItems: [textoInformado], applicationActivities: nil)
            
            // Excluindo opções de aplicativos para compartilhamento
            compartilhador.excludedActivityTypes = [.airDrop, .postToFacebook]
            
            present(compartilhador, animated: true, completion: nil)
            
        } else {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo corretamente", preferredStyle: .alert)
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(acaoOK)
            present(alerta, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func compartilharImagem(_ sender: UIButton) {
        
        // --- Para que se tenha acesso para salvar imagens no álbum de fotos, precisamos da permissão Privacy - Photo Library Additions Usage Description
        
        //let imagemURL = Bundle.main.url(forResource: "wonder", withExtension: "png")
        
        // Método que transforma a representação de um PNG em Bytes
        let imagemX = UIImagePNGRepresentation(imageWW.image!)
        
        compartilhador = UIActivityViewController(activityItems: [imagemX!], applicationActivities: nil)
        
        present(compartilhador, animated: true, completion: nil)
        
    }
    
    
}

