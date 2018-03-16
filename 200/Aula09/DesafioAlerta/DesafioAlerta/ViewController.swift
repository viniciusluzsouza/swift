//
//  ViewController.swift
//  DesafioAlerta
//
//  Created by Vinicius Luz Souza on 30/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var btAcaoDestrutiva: UIButton!
    
    // MARK: - Propriedades
    var logins = [String: String]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.txtLogin.placeholder = "Escolha seu login"
        self.txtSenha.placeholder = "Escolha sua senha"
        self.txtSenha.isSecureTextEntry = true
        self.btAcaoDestrutiva.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func cadastrar(_ sender: UIButton) {
        if self.txtLogin.hasText && self.txtSenha.hasText {
            self.logins[self.txtLogin!.text!] = self.txtSenha!.text!
            self.txtLogin.isHidden = true
            self.txtSenha.isHidden = true
            self.btCadastrar.isHidden = true
            self.txtLogin.resignFirstResponder()
            self.txtSenha.resignFirstResponder()
        } else {
            self.criarAlertaComumOk(titulo: "Alerta", msg: "Preencha corretamente os campos para completar o seu cadastro.")
        }
    }
    
    @IBAction func acessar(_ sender: UIButton) {
        if self.txtLogin.isHidden {
            self.criarAlertaLoginESenha(titulo: "Alerta", msg: "Efetue seu login")
        } else {
            if self.txtLogin.hasText && self.txtSenha.hasText {
                if self.logins[self.txtLogin!.text!] == self.txtSenha!.text! {
                    // conseguiu logar
                } else {
                    self.criarAlertaComumOk(titulo: "Alerta", msg: "Login ou senha Inválidos")
                }
            } else {
                self.criarAlertaComumOk(titulo: "Alerta", msg: "Faça o cadastro antes de prosseguir")
            }
        }
    }
    
    @IBAction func acaoDestrutiva(_ sender: UIButton) {
        self.criarActionSheet(titulo: "Alerta!", msg: "Voce realmente deseja realizar esta acao?")
    }
    
    
    
    // MARK: - Métodos
    func criarAlertaComumOk(titulo : String, msg : String) {
        let alerta : UIAlertController = UIAlertController(title: titulo, message: msg, preferredStyle: .alert)
        let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(acaoOk)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func criarAlertaLoginESenha(titulo : String, msg : String) {
        let alerta = UIAlertController(title: titulo, message: msg, preferredStyle: .alert)
        let acaoOK = UIAlertAction(title: "OK", style: .default) { (action) in
            if (self.logins[alerta.textFields![0].text!] == alerta.textFields![1].text!) {
                self.btAcaoDestrutiva.isHidden = false
            } else {
                self.criarAlertaComumOk(titulo: "Alerta", msg: "Login ou senha Inválidos")
            }
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(acaoOK)
        alerta.addAction(acaoCancelar)
        
        alerta.addTextField { (textField) in
            textField.placeholder = "Insira seu login"
        }
        
        alerta.addTextField { (textField) in
            textField.placeholder = "Insira sua senha"
            textField.isSecureTextEntry = true
        }
        
        self.present(alerta, animated: true, completion: nil)
    }

    func criarActionSheet(titulo : String, msg : String){
        let actionSheet = UIAlertController(title: titulo, message: msg, preferredStyle: .actionSheet)
        let acaoDestrutiva = UIAlertAction(title: "Sim Desejo!", style: .destructive) { (action) in
            self.criarAlertaComumOk(titulo: "Sucesso", msg: "Acao realizada com sucesso!")
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        actionSheet.addAction(acaoCancelar)
        actionSheet.addAction(acaoDestrutiva)
        
        self.present(actionSheet, animated: true, completion: nil)
    }

}
