//
//  TabelaViewController.swift
//  TableViewController
//
//  Created by Vinicius Luz Souza on 01/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class TabelaViewController: UITableViewController {
    
    var arrayCDs = ["Calypso", "Mr Catra Acústico", "Reginaldo Rossi"]
    var arrayFilmes = ["Homem de Ferro", "Os Vingadores", "Batman", "Monstros SA"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // Método que define a quantidade de sections na table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // Método que define a quantidade de linhas em cada sextion
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Verificamos se a section é a primeira
        if section == 0 {
            // Caso seja
            
            // Retornamos a mesma quantidade de objetos presentes do array de cds
            return self.arrayCDs.count
        } else {
            // Caso não seja a primeira, ou seja, estamos na segunda (section 1)
            
            // Retornamos a mesma quantidade de objetos presentes no nosso array de Filmes
            return self.arrayFilmes.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        // Configure the cell...
        
        // Verificando em qual section estamos
        if (indexPath.section == 0){
            // Se estamos na section 0
            
            // O texto da nossa célula recebe um item para cada linha dos nomes que estão em nosso array de CDs
            cell.textLabel?.text = self.arrayCDs[indexPath.row]
        } else {
            // Caso não estejamos na seção 0, ou seja, estamos na seção 1, pois só temos 2 seções
            
            // Nossa célula recebe como título um item do nosso array que contém os filmes para cada linha da section.
            
            cell.textLabel?.text = self.arrayFilmes[indexPath.row]
        }

        return cell
    }
    
    // MARK: Métodos de UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) Row: \(indexPath.row)")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "CDs"
        } else {
            return "Filmes"
        }
    }
    
}
