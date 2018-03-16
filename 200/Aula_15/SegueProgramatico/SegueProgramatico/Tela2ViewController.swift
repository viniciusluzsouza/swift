//
//  Tela2ViewController.swift
//  SegueProgramatico
//
//  Created by Swift on 07/02/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    var propriedadeVindaDeOutraTela : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if let conteudo = propriedadeVindaDeOutraTela {

            print(conteudo)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func voltar(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil)
    }
    
   
}
