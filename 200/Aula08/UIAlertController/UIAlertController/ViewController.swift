//
//  ViewController.swift
//  UIAlertController
//
//  Created by Vinicius Luz Souza on 26/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    
    // MARK: - Métodos
    @IBAction func criarAlertaComum(_ sender: UIButton) {
        
        //Criando o alerta
        let alertaComum : UIAlertController = UIAlertController(title: "Titulo do alerta comum", message: "Mensagem do alerta comum", preferredStyle: .alert)
    
        // Adicionando uma acao ao alerta
        let acaoOk = UIAlertAction(title: "OK", style: .default) { (action) in
            // Ações que serão executadas quando o botão ok for acionado
            print("Clicou OK")
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertaComum.addAction(acaoOk)
        alertaComum.addAction(acaoCancelar)
        
        // Apresentando um UIAlertController
        self.present(alertaComum, animated: true, completion: nil)
        
    }
    
    @IBAction func criarAlertaComTexto(_ sender: UIButton) {
        
        let alerta = UIAlertController(title: "Alerta com texto", message: "Digite seu nome e clique em OK", preferredStyle: .alert)
        
        let acaoOK = UIAlertAction(title: "OK", style: .default) { (action) in
            
            // Acoes para o botao aqui
            
            // Resgatando a primeira textField inserida (no caso só temos 1)
            let textField = alerta.textFields![0]
            
            // Resgatando o texto da nossa textFiel
            let textoDigitado = textField.text!
            print(textoDigitado)
            
            
        }
        alerta.addAction(acaoOK)
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        
        alerta.addTextField { (textField) in
            textField.placeholder = "Digite algo aqui"
        }
        
        self.present(alerta, animated: true) {
            print("Acabou de apresentar")
        }
        
    }
    
    @IBAction func criarAlertaComSenha(_ sender: UIButton) {
        
        let alerta = UIAlertController(title: "Alerta com texto", message: "Digite seu nome e clique em OK", preferredStyle: .alert)
        
        let acaoOK = UIAlertAction(title: "OK", style: .default) { (action) in
            
            // Acoes para o botao aqui
            
            // Resgatando a primeira textField inserida (no caso só temos 1)
            let textField = alerta.textFields![0]
            
            // Resgatando o texto da nossa textFiel
            let textoDigitado = textField.text!
            print(textoDigitado)
        
        }
    
        alerta.addAction(acaoOK)
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        
        alerta.addTextField { (textField) in
            textField.placeholder = "Digite sua senha"
            textField.isSecureTextEntry = true
        }
        
        self.present(alerta, animated: true) {
            print("Acabou de apresentar")
        }
    
    }
    
    @IBAction func criarAlertaLoginESenha(_ sender: UIButton) {
        
        let alerta = UIAlertController(title: "Alerta com texto", message: "Digite seu nome e clique em OK", preferredStyle: .alert)
        
        let acaoOK = UIAlertAction(title: "OK", style: .default) { (action) in
            
            // Acoes para o botao aqui
            
            // Resgatando a primeira textField inserida
            let textField = alerta.textFields![0]
            
            // Resgatando o texto da nossa textFiel
            let textoDigitado = textField.text!
            print(textoDigitado)
            
            // ----
            
            // Resgatando a segunda textField inserida
            let textFieldSenha = alerta.textFields![1]
            
            // Resgatando o texto da nossa textField
            let senhaDigitada = textFieldSenha.text!
            print(senhaDigitada)
            
        }
        alerta.addAction(acaoOK)
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        
        alerta.addTextField { (textField) in
            textField.placeholder = "Digite algo aqui"
        }
        
        alerta.addTextField { (textField) in
            textField.placeholder = "Senha"
            textField.isSecureTextEntry = true
        }
        
        self.present(alerta, animated: true) {
            print("Acabou de apresentar")
        }
        
        
    }
    
    @IBAction func criarActionSheet(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "ActionSheet!", message: "Mensagem do ActionSheet", preferredStyle: .actionSheet)
        
        let acaoOK = UIAlertAction(title: "OK", style: .default) { (action) in
            print("Clicou OK")
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        let acaoDestrutiva = UIAlertAction(title: "Ação destrutiva", style: .destructive) { (action) in
            print("Clicou ação destrutiva")
        }
        
        actionSheet.addAction(acaoOK)
        actionSheet.addAction(acaoCancelar)
        actionSheet.addAction(acaoDestrutiva)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    
    
    
}

