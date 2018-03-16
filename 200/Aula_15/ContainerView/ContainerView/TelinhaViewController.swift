//
//  TelinhaViewController.swift
//  ContainerView
//
//  Created by Swift on 07/02/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class TelinhaViewController: UIViewController {

    @IBOutlet weak var labelUnica: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.labelUnica.text = "Funfou Mesmo!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
