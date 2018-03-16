//
//  ViewController.swift
//  UtilizandoSafariServices
//
//  Created by Vinicius Luz Souza on 28/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável por trazer uma janela do Safari para dentro da aplicação.
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK:- Actions
    @IBAction func abrirEndereco(_ sender: UIButton) {
        let endereco = URL(string: "http://www.apple.com")
        let meuSafari = SFSafariViewController(url: endereco!)
        
        meuSafari.delegate = self
        
        // Mudando a cor dos botões
        meuSafari.preferredControlTintColor = UIColor.white
        
        // Mudando a cor de fundo das barras
        meuSafari.preferredBarTintColor = UIColor.black
        
        // Definindo o estilo de escrita do botao
        meuSafari.dismissButtonStyle = .done
        
        present(meuSafari, animated: true, completion: nil)
    }
    
}


// MARK:- Extensão para adoção do protocolo SFSafariViewControllerDelegate
extension ViewController : SFSafariViewControllerDelegate {
    
    // Método que é disparado quando o carregamento inicial de uma página se inicia
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("Carregamento inicial concluído.")
    }
    
    // Método disparado quando a janela do SafariVC é encerrada
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("SafariVC encerrado!")
    }
    
    
}
