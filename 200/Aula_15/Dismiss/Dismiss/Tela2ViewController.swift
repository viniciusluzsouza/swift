//
//  Tela2ViewController.swift
//  Dismiss
//
//  Created by Swift on 07/02/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Propriedades

    // MARK: - View Life Cycle


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        print("Tela2: View did Load")
    }
    override func viewWillAppear(_ animated: Bool) {

        print("Tela 2: viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {

        print("Tela 2: viewDidAppear")

    }

    override func viewWillDisappear(_ animated: Bool) {

        print("Tela 2: viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {

        print("Tela 2: View did Disappear")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Métodos

    // MARK: - Actions

    @IBAction func voltarSemSegue(_ sender: UIButton) {


        // Usando o método abaixo podemos voltar a tela de origem da chamada do segue da nossa tela atual.
        self.dismiss(animated: true, completion: nil)
        
    }
}
