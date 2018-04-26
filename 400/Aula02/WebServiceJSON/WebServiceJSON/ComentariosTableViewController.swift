//
//  ComentariosTableViewController.swift
//  WebServiceJSON
//
//  Created by Vinicius Luz Souza on 03/04/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ComentariosTableViewController: UITableViewController {
    
    var comentariosArray = [Comentario]()
    var editarComentarioAction : UITableViewRowAction?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Criar a acao de edicao da celula
        self.editarComentarioAction = UITableViewRowAction(style: .normal, title: "Editar", handler: { (action, indexPath) in
            
            // Resgatar o comentário da linha que solicitou a edição
            let comentario = self.comentariosArray[indexPath.row]
            
            // Criar um alerta para resgatar o novo texto do comentário
            let alerta = UIAlertController(title: "Editar comentário", message: "Digite o novo comentário e toque em Enviar", preferredStyle: .alert)
            
            // Adicionar um campo de texto no alerta
            alerta.addTextField(configurationHandler: { (textField) in
                // Definir que as frases devem começar em maíusculo
                textField.autocapitalizationType = .sentences
            })
            
            // Criar a ação de enviar
            alerta.addAction(UIAlertAction(title: "Enviar", style: .default, handler: { (_) in
                // Garantir que possuimos o texto e verificar que existem mais de 2 caracteres na string
                guard let novoTexto = alerta.textFields?.first?.text, novoTexto.count > 2 else { return }
                
                comentario.editar(texto: novoTexto, callback: { (comentarioEditado) in
                    if comentarioEditado != nil {
                        // Substituir o objeto no array local (estudem realm quando trabalhar com base de dados)
                        self.comentariosArray[indexPath.row] = comentarioEditado!
                        
                        // Atualizar a célula
                        // Resgatar a célula atual
                        let cell = self.tableView.cellForRow(at: indexPath)
                        
                        // Atualizar a label
                        cell?.detailTextLabel?.text = comentarioEditado?.texto
                        
                    } else {
                        print("Falha ao editar comentário")
                    }
                })
            }))
            
            // Criar a ação de cancelar
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            
            // Exibir o alerta
            self.present(alerta, animated: true, completion: nil)
            
        })
        
        Comentario.listar { (comentarios) in
            if comentarios != nil {
                // Adicionar os comentários do servidor no array local
                self.comentariosArray.append(contentsOf: comentarios!)
                
                // Atualizar a tableview
                self.tableView.reloadData()
                
            } else {
                print("Falha no recebimento dos comentários")
            }
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // Definir a quantidade de seções na tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Definir o numero de linhas na seção da tabela, com base na quantidade de comentários
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comentariosArray.count
    }

    // Definir a celula da linha
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Resgatar o comentário da linha atual
        let comentario = self.comentariosArray[indexPath.row]

        cell.textLabel?.text = comentario.nome
        cell.detailTextLabel?.text = comentario.texto
        
        return cell
    }
 
    // Função que define ações customizadas para a célula
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [self.editarComentarioAction!]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
