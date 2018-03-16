//
//  ViewController.swift
//  DateFormatter
//
//  Created by Vinicius Luz Souza on 31/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Criando o objeto
        let dataAtual = Date()
        
        // Exibindo o objeto de data
        print("Data atual: \(dataAtual)")
        
        print("--------------------------")
        
        // Temos uma classe padrão para gerenciar a formatação de um objeto de Date. O DateFormatter te como função formatar um objeto de Date
        
        // Criando um elemento formatador de data
        let formatador = DateFormatter()
        
        // Setando um style em nosso formatador para exibição
        
        // Formato FullStyle
        formatador.dateStyle = .full
        print("Data em FullStyle: \(formatador.string(from: dataAtual))")
        
        // Formato MediumStyle
        formatador.dateStyle = .medium
        print("Data em MidiumStyle: \(formatador.string(from: dataAtual))")
        
        // Formato em ShortStyle
        formatador.dateStyle = .short
        print("Data em shortStyle: \(formatador.string(from: dataAtual))")
        
        // Podemos também criar nosso próprio estilo de formatação
        // Setando um estilo personalizado no formatador
        formatador.dateFormat = "dd/MM/yyyy HH:mm:ss"
        print("Meu próprio estilo: \(formatador.string(from: dataAtual))")
        
        // Criando um locale
        let localizacao = Locale(identifier: "pt_BR")
        formatador.locale = localizacao
        formatador.dateStyle = .full
        print("Data formatada Brasil: \(formatador.string(from: dataAtual))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

