//
//  ViewController.swift
//  WebKitSimples
//
//  Created by Vinicius Luz Souza on 27/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

/* -------- Glossário --------
 
    -- Sites com protocolo seguro https, não precisam de permissão para serem acessados
 
    -- Para acessarmos sites sem protocolo https (http, ftp, etc), precisamos pedir uma permissão ao sistema iOS. Essa permissão é requerida no arquivo que está dentro do nosso pacote com o nome de Info.plist
 
    -- No info.plist adicionar app transport security settings e dentro dele adicionar allow arbitrary loads. É importante após a inserção do app transport, abrir a seta que fica ao lado do objeto, fazendo com que ela aponte para baixo.
*/

import UIKit

// Importar o framework responsável por abrir janelas da web dentro da aplicação
import WebKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var minhaWKView: WKWebView!
    
    
    // MARK:- Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Criando um objeto URL que indica um endereço na Web
        // Digite o endereço web completo indicando o protocolo http ou https
        let endereco = URL(string: "http://www.digitro.com")
        
        // Criando uma requisição para logar o endereço da web
        let requisicaoLoad = URLRequest(url: endereco!)
        
        // Executando a requisição de load
        minhaWKView.load(requisicaoLoad)
        
    }

}

