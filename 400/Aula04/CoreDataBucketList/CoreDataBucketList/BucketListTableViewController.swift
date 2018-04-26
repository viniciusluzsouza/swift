//
//  BucketListTableViewController.swift
//  CoreDataBucketList
//
//  Created by Vinicius Luz Souza on 06/04/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import CoreData

class BucketListTableViewController: UITableViewController {
    
    // Variável para guardar os registros em memória
    var objetivos = [Objetivo]()
    
    //Variável do AppDelegate, para acessarmos uma instância do banco de dados
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    // Variável do contexto do banco. Una espécie de cópia local do DB, onde efetuamos todas as alterações e depois salvamos no disco
    var contextBanco : NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Resgatar uma instância do banco
        self.contextBanco = self.appDelegate.persistentContainer.viewContext
        
        // Criar uma requisição para resgatar os registros
        let requisicao: NSFetchRequest = Objetivo.fetchRequest()
        
//        requisicao.predicate = NSPredicate(format: "nome = %@", "C63 AMG")
//        // https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html
//        requisicao.fetchLimit = 10
//        requisicao.fetchOffset = 20

        // Executar a requisição
        do {
            guard let resultadoRequisicao = try self.contextBanco?.fetch(requisicao) else { return }
            
            // Adicionar os resultados no array
            self.objetivos.append(contentsOf: resultadoRequisicao)
            
        } catch {
            print("Falha ao resgatar registros : \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func adicionar(_ sender: UIBarButtonItem) {
        // Criar o alert da requisição do nome do objetivo
        let alerta = UIAlertController(title: "Adicionar um objetivo de VIDA", message: nil, preferredStyle: .alert)
        
        // Adicionar um campo de texto no alert
        alerta.addTextField { (textField) in
            textField.autocapitalizationType = .words
            textField.placeholder = "Nome"
        }
        
        // Adicionar as ações do alerta
        alerta.addAction(UIAlertAction(title: "Adicionar", style: .default, handler: { (_) in
            // Garantir que possuímos o nome do objetivo
            guard let nome = alerta.textFields?.first?.text else { return }
            
            guard self.contextBanco != nil else { return }
            
            // Criar um novo registro de Objetivo
            let novoObjetivo = Objetivo(context: self.contextBanco!)
            
            // Definir os dados do novo objetivo
            novoObjetivo.nome = nome
            novoObjetivo.dataCriacao = Date()
            novoObjetivo.concluido = false
            
            // Salvar o contexto onde o novo registro foi criado
            do {
                try self.contextBanco?.save()
            } catch {
                print("Falha ao criar o novo registro: \(error)")
                return
            }
            
            // Adicionar o novo registro no array local
            self.objetivos.append(novoObjetivo)
            
            // Adicionar uma nova célula na tabela
            self.tableView.insertRows(at: [IndexPath(row: self.objetivos.count - 1, section: 0)], with: .automatic)
            
        }))
        
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (_) in
        }))
        
        // Exibir o alerta
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objetivos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Resgatar o objetivo da linha atual
        let objetivo = self.objetivos[indexPath.row]
        
        // Exibir os dados do objetivo
        cell.textLabel?.text = objetivo.nome
        cell.accessoryType = objetivo.concluido ? .checkmark : .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Resgatar o objetivo selecionado pelo usuário
        let objetivo = self.objetivos[indexPath.row]
        
        // Inverter o valor do concluído
        objetivo.concluido = !objetivo.concluido
        
        // Salvar o contexto onde as alterações foram efetuadas
        do {
            try self.contextBanco?.save()
        } catch {
            print("Falha ao alterar o objetivo: \(error)")
            return
        }
        
        // Resgatar a célula tocada
        let cell = tableView.cellForRow(at: indexPath)
        
        // Atualizar os dados da célula
        cell?.accessoryType = objetivo.concluido ? .checkmark : .none
        
        // Desselecionar a célula
        tableView.deselectRow(at: indexPath, animated: true)
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Resgatar o objetivo que o usuário está interagindo
            let objetivo = self.objetivos[indexPath.row]
            
            // Remover o registro do array local
            self.objetivos.remove(at: indexPath.row)
            
            // Remover o registro do context
            self.contextBanco?.delete(objetivo)
            
            // Salvar o contexto alterado
            do {
                try self.contextBanco?.save()
            } catch {
                print("Falha ao remover registro do banco: \(error)")
            }
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Função para alterar o nome do botão de apagar da célula
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Apagar"
    }


}
