//
//  ObjetivosTableViewController.swift
//  BucketListCloudKit
//
//  Created by Vinicius Luz Souza on 09/04/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import CloudKit

class ObjetivosTableViewController: UITableViewController {
    
    // Array para exibir os dados na tableView
    var objetivos = [CKRecord]()
    
    // Variável de referência do DB
    var bancoDeDados: CKDatabase?
    
    // Zona de dados
    let zona = CKRecordZone(zoneName: "MeusObjetivos")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Resgatar uma instância do DB, privado
        self.bancoDeDados = CKContainer.default().privateCloudDatabase
        
        // Salvar a zona
        self.bancoDeDados?.save(self.zona, completionHandler: { (zonaRecebida, erro) in
            if erro != nil {
                print("Falha ao criar a zona: \(erro)")
            } else {
                print("Sucesso ao criar a zona.")
                
                // Resgatar os registros existentes
                // Criar a Query
                let query = CKQuery(recordType: "Objetivo", predicate: NSPredicate(value: true))
                
                // Executar a Query
                self.bancoDeDados?.perform(query, inZoneWith: self.zona.zoneID, completionHandler: { (registros, erro) in
                    // Garantir que recebemos os registros
                    guard registros != nil else {
                        print("Falha ao resgatar registros : \(erro)")
                        return
                    }
                    
                    // Adicionar os registros no array local
                    self.objetivos.append(contentsOf: registros!)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Adicionar Objetivo", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Salvar", style: .default, handler: { (_) in
            // Garantir que possuímos o nome do objetivo
            guard let nome = alert.textFields?.first?.text, nome.count > 0 else { return }
            
            // Criar um novo registro
            let novoObjetivo = CKRecord(recordType: "Objetivo", zoneID: self.zona.zoneID)
            
            // Definir o valor do nome do objetivo
            novoObjetivo.setValue(nome, forKey: "nome")
            
            // Salvar o novo objetivo no DB
            self.bancoDeDados?.save(novoObjetivo, completionHandler: { (novoObjetivoSalvo, erro) in
                // Verificar se recebemos o objetivo
                guard novoObjetivoSalvo != nil else {
                    print("Falha ao criar o novo objetivo: \(erro)")
                    return
                }
                
                // Adicioanar o objeto salvo no array local
                self.objetivos.append(novoObjetivoSalvo!)
                
                // Acessar a main queue, para alterarmos a interface
                DispatchQueue.main.async {
                    // Adicionar uma célula na tabela
                    self.tableView.insertRows(at: [IndexPath(row: self.objetivos.count - 1, section: 0)], with: .automatic)
                }
                
            })
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Equivalente a quantidade de itens no array
        return self.objetivos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Resgatar o objetivo da linha atual
        let objetivo = self.objetivos[indexPath.row]
        
        // Exibir os dados
        cell.textLabel?.text = objetivo.value(forKey: "nome") as? String
        
        //
        var isConcluido = objetivo.value(forKey: "concluido") as? Bool
        
        if isConcluido == nil {
            isConcluido = false
        }
        
        cell.accessoryType = isConcluido! ? .checkmark : .none

        return cell
    }
    
    // MARK: - Table View delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Resgatar o objetivo selecionado
        let objetivo = self.objetivos[indexPath.row]
        
        // Resgatar o valor do field de concluído
        var isConcluido = objetivo.value(forKey: "concluido") as? Bool
        
        // Inveter o valor do Bool
        if isConcluido == true {
            isConcluido = false
        } else {
            isConcluido = true
        }
        
        // Setar o valor no registro
        objetivo.setValue(isConcluido!, forKey: "concluido")
        
        // Atualizar a célula
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        // Salvar a alteração do objeto na nuvem/DB
        self.bancoDeDados?.save(objetivo, completionHandler: { (objetivoSalvo, erro) in
            guard erro != nil else { return }
            print("Falha ao salvar edição do objetivo: \(erro)")
        })
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Regatar o objetivo que será removido
            let objetivo = self.objetivos[indexPath.row]
            
            // Remover o objetivo do DB
            self.bancoDeDados?.delete(withRecordID: objetivo.recordID, completionHandler: { (objetivoRemovido, erro) in
                guard erro == nil else {
                    print("Falha ao remover registro: \(erro)")
                    return
                    
                }
            })
            
            // Remover do array local
            self.objetivos.remove(at: indexPath.row)
            
            DispatchQueue.main.async {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
