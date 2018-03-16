//
//  ViewController.swift
//  Dismiss
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

		print("Tela 1 - viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {


        print("Tela 1- viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {

        print("Tela 1 - viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {

        print("Tela1 - viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {

        print("Tela 1 - viewDidDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Métodos

 

    // MARK: - Actions

}

