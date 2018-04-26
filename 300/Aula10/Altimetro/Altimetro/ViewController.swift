//
//  ViewController.swift
//  Altimetro
//
//  Created by Vinicius Luz Souza on 12/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var labelAltura: UILabel!
    
    
    // MARK:- Propriedades
    let altimetro = CMAltimeter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelAltura.text = "0.00 m"
        
    }

    
    // MARK:- Actions
    @IBAction func iniciar(_ sender: UIButton) {
        
        if CMAltimeter.isRelativeAltitudeAvailable() {
            
            print("Altimetro disponivel")
            altimetro.startRelativeAltitudeUpdates(to: .main, withHandler: { (dados, erros) in
                if erros == nil {
                    let altura = Float(truncating: dados!.relativeAltitude)
                    let alturaFormatada = String(format: "%.2f", altura) + " m"
                    self.labelAltura.text = alturaFormatada
                }
            })
            
        } else {
            print("Altimetro indisponivel")
        }
        
    }
    

}

