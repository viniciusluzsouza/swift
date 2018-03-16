//
//  PratosTableViewController.swift
//  DesafioCardapio
//
//  Created by Swift on 09/02/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class PratosTableViewController: UITableViewController {

    var arrayPratos : [Prato] = [Prato(nome: "Feijão Tropeiro", preco: 22), Prato(nome: "Ovo Frito", preco: 18), Prato(nome: "Frango Passarinho", preco: 28), Prato(nome: "Bife com Fritas", preco: 32), Prato(nome: "Feijuca", preco: 35), Prato(nome: "Churras", preco: 48)]

    //["Feijão Tropeiro", "Ovo frito", "Frango a passarinho", "Bife com fritas", "Feijoada", "Churrasco"]

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
        return self.arrayPratos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        cell.textLabel?.text = self.arrayPratos[indexPath.row].nome
        cell.detailTextLabel?.text = "\(Float(self.arrayPratos[indexPath.row].preco))"
		cell.isUserInteractionEnabled = false
        
        return cell
    }


}
