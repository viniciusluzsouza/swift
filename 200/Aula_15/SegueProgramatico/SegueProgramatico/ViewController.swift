//
//  ViewController.swift
//  SegueProgramatico
//
//  Created by Swift on 07/02/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Propriedades

    // MARK: - View Life Cycle


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if(segue.identifier == "segueTela2"){


		let tela2vc = segue.destination as! Tela2ViewController

		tela2vc.propriedadeVindaDeOutraTela = sender as? String

        }

    }

    // MARK: - Métodos

    // MARK: - Actions

    @IBAction func irParaTela2(_ sender: UIButton) {


            self.performSegue(withIdentifier: "segueTela2", sender: "OBJETO PASSADO PELO SEGUE")

    }
}

