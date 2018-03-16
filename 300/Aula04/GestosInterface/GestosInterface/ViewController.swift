//
//  ViewController.swift
//  GestosInterface
//
//  Created by Vinicius Luz Souza on 01/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var viewParaInteracao: UIView!
    
    // MARK:- Propriedades
    var flagPodeMover = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewParaInteracao.backgroundColor = UIColor.red
        
    }


    // MARK:- Actions
    @IBAction func dispararTap(_ sender: UITapGestureRecognizer) {
        if viewParaInteracao.backgroundColor == UIColor.red {
            viewParaInteracao.backgroundColor = UIColor.blue
            flagPodeMover = true
        } else {
            viewParaInteracao.backgroundColor = UIColor.red
            flagPodeMover = false
        }
    }
    
    @IBAction func dispararPan(_ sender: UIPanGestureRecognizer) {
        if flagPodeMover {
            let posicao = sender.location(in: self.view)
            viewParaInteracao.center = posicao
        }

    }
    
    
    
    
}

