//
//  ListaTableViewController.swift
//  VisualizadorPDF
//
//  Created by Vinicius Luz Souza on 26/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import QuickLook

class ListaTableViewController: UITableViewController {
    
    // MARK:- Propriedades
    let arrayPDF = ["5_Conselhos", "Identdade da Sua Empresa", "Marketing Digital"]
    
    
    // MARK:- Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPDF.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        cell.textLabel?.text = arrayPDF[indexPath.row]
        
        return cell
    }
    
    // MARK:- Métodos de UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let visualizador = QLPreviewController()
        visualizador.dataSource = self
        
        // Comando para exibir uma controller dentro de um contexto de navigationController
        navigationController?.pushViewController(visualizador, animated: true)
    }


}

// MARK:- Extensão para adoção do protocolo QLPreviewControllerDataSource
extension ListaTableViewController : QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let indice = tableView.indexPathForSelectedRow?.row
        
        let nomeArquivo = arrayPDF[indice!]
        
        let caminhoArquivo = Bundle.main.path(forResource: nomeArquivo, ofType: "pdf")
        
        let arquivoURL = URL(fileURLWithPath: caminhoArquivo!)
        
        return arquivoURL as QLPreviewItem
    }
    
    
}








