//
//  BebidasViewController.swift
//  DesafioCardapio
//
//  Created by Swift on 09/02/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class BebidasViewController: UITableViewController {

    //var arrayBebidas = ["Coca", "Guaraná", "Suco de Maracujá", "Refresco de Tamarindo", "Toddynho Meio amargo"]

    var arrayBebidas : [Bebida] = [Bebida(nome: "Coca", preco: 5), Bebida(nome: "Guaraná", preco: 4), Bebida(nome: "Suco de Maracujá", preco: 3), Bebida(nome: "Refresco de Tamarindo", preco: 5), Bebida(nome: "Toddynho Meio Amargo", preco: 2)]
    
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
        return self.arrayBebidas.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        cell.textLabel?.text = self.arrayBebidas[indexPath.row].nome
        cell.detailTextLabel?.text = "\(Float(self.arrayBebidas[indexPath.row].preco))"
        cell.isUserInteractionEnabled = false
        
        return cell
    }

    

}
