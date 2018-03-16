//
//  ViewController.swift
//  TratamentoDeErros
//
//  Created by Vinicius Luz Souza on 15/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var login = "admin"
    var senha = "admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Chamando o método
        // self.efetuarLogin(umLogin: "admi", umaSenha: "admon")
        /*
         Quando tentamos efetuar uma chamada de uma throw function, o sistema obriga a realizar uma espécie de tratativa
         */
        
        // -------------- Catch Genérico --------------
        do {
            try self.efetuarLogin(umLogin: "admin", umaSenha: "admin")
        } catch {
            print("Login não efetuado!")
        }
        
        // -------------- Catch específico --------------
        do {
            try self.efetuarLogin(umLogin: "admim", umaSenha: "admin")
        } catch ErroDeAcesso.loginESenhaErrados {
            print("Login e senha errados")
        } catch ErroDeAcesso.senhaErrada {
            print("Senha errada")
        } catch ErroDeAcesso.loginErrado {
            print("Login errado")
        } catch {
            print("Erro desconhecido")
        }
        
        // -------------- Tratando com if let --------------
        
        if let _ = try? efetuarLogin(umLogin: "admim", umaSenha: "admim") {
            print("Deu bom")
        } else {
            print("Deu ruim")
        }
        
        // -------------- Try! --------------
        
        try! efetuarLogin(umLogin: "admin", umaSenha: "admi")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func efetuarLogin(umLogin : String, umaSenha : String) throws {
        
        if (umLogin != self.login && umaSenha != self.senha) {
            throw ErroDeAcesso.loginESenhaErrados
        } else if (umaSenha != self.senha) {
            throw ErroDeAcesso.senhaErrada
        } else if (umLogin != self.login) {
            throw ErroDeAcesso.loginErrado
        }
        
        print("Login efetuado com sucesso")
        
    }

}

