//
//  SobremesasViewController.swift
//  DesafioCardapio
//
//  Created by Swift on 09/02/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class SobremesasViewController: UITableViewController {

    //var arraySobremesa = ["Salada de Frutas", "Sorvete", "Profiterole", "Geladinho", "Chiclete"]
    
    var arraySobremesa : [Sobremesa] = [Sobremesa(nome: "Salada de Frutas", preco: 3), Sobremesa(nome: "Sorvete", preco: 3), Sobremesa(nome: "Profiterole", preco: 5), Sobremesa(nome: "Geladinho", preco: 2), Sobremesa(nome: "Chiclete", preco: 1)]

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arraySobremesa.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        cell.textLabel?.text = self.arraySobremesa[indexPath.row].nome
        cell.detailTextLabel?.text = "\(Float(self.arraySobremesa[indexPath.row].preco))"
        cell.isUserInteractionEnabled = false

        return cell
    }
   

}
