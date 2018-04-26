//
//  ViewController.swift
//  SQLite
//
//  Created by Vinicius Luz Souza on 05/04/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    @IBOutlet weak var logTextView: UITextView!
    
    // Será utilizado OpaquePointer, pois como a library SQLite é escrita em C, não possuímos representação em Swift.
    // Variável que representará a base de dados
    var banco: OpaquePointer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Limpar a textView
        self.logTextView.text = ""
        
        
        // Resgatar o diretório Documents
        let documents = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        // Garantir que possuímos o caminho do DB
        guard let pathDB = documents?.appendingPathComponent("db.sqlite") else {
            self.logTextView.text = "Falha ao criar o caminho do banco"
            return
        }
        
        print(pathDB)
        
        // Função que cria ou abre um banco de dados
        if sqlite3_open(pathDB.absoluteString, &self.banco) == SQLITE_OK {
            self.logTextView.text.append("\nBanco Aberto")
            
            // Montar o comando de criação da tabela
            let query = "create table if not exists PESSOAS (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nome TEXT, idade INTEGER)"
            
            // Executar o comando no banco
            if sqlite3_exec(self.banco, query, nil, nil, nil) == SQLITE_OK {
                self.logTextView.text.append("\nTabela criada com sucesso.")
            } else {
                let erro = String(cString: sqlite3_errmsg(self.banco!))
                self.logTextView.text.append("\nFalha na criação da tabela: \(erro)")
            }
            
        } else {
            // Garantir que possuímos a variável do DB
            guard self.banco != nil else { return }
            
            // Resgatar a string do erro
            let erro = String(cString: sqlite3_errmsg(self.banco!))
            
            // Exibir o erro na textView de log
            self.logTextView.text.append("Falha ao criar/abrir o DB: \(erro)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func salvar(_ sender: UIButton) {
        // Garantir que possuímos os dados do usuário
        guard let nome = self.nomeTextField.text else { return }
        guard let idade = self.idadeTextField.text else { return }
        
        // Montar o comando de adição do registro
        let query = "insert into PESSOAS values (NULL, '\(nome)', \(idade))"
        
        // Executar o comando
        if sqlite3_exec(self.banco, query, nil, nil, nil) == SQLITE_OK {
            self.logTextView.text.append("\nRegistro adicionado.")
            
            // Limpar os campos
            self.nomeTextField.text = nil
            self.idadeTextField.text = nil
            
            // Finalizar a edição
            self.view.endEditing(true)
            
        } else {
            let erro = String(cString: sqlite3_errmsg(self.banco!))
            self.logTextView.text.append("\nFalha na inserção do registro: \(erro)")
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
        // Comando para resgatar os registros
        let query = "select * from PESSOAS"
        
        // Variável que armazenará o valor gerado pelo select
        var statement: OpaquePointer?
        
        // Função que executa um comando no banco e guarda resultados
        if sqlite3_prepare_v2(self.banco!, query, -1, &statement, nil) != SQLITE_OK {
            let erro = String(cString: sqlite3_errmsg(self.banco!))
            self.logTextView.text.append("\nFalha no resgate dos registros: \(erro)")
            return
        }
        
        // Estrutura de repetição para percorrer todos os resultados
        while sqlite3_step(statement) == SQLITE_ROW {
            // Resgatar os valores das colunas
            let id = sqlite3_column_int(statement, 0)
            let nome = String(cString: sqlite3_column_text(statement, 1))
            let idade = sqlite3_column_int(statement, 2)
            
            self.logTextView.text.append("\nID: \(id) | Nome: \(nome) | Idade: \(idade)")
            
        }
        
        // Ao concluir o trabalho, devemos descartar o resultado
        sqlite3_finalize(statement)
        
    }
    
    
}

