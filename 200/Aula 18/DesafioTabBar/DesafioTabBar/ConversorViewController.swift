//
//  ConversorViewController.swift
//  DesafioTabBar
//
//  Created by Vinicius Luz Souza on 14/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ConversorViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var labelReal: UILabel!
    @IBOutlet weak var labelDolar: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    // MARK: - Propriedades
    let cotacao : Float = 3.15
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.labelReal.text = "Real: R$ 0.0"
        self.labelDolar.text = "Dolar: US$ 0.00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func converter(_ sender: UISlider) {
        self.converterMoeda()
    }
    
    
    // MARK: - Métodos
    func converterParaReal(valorDollar: Float, cotacao : Float) -> Float {
        return valorDollar * cotacao
    }
    
    func converterMoeda() {
        let dolar = self.slider.value
        
        self.labelReal.text = "Real: R$ \(self.converterParaReal(valorDollar: dolar, cotacao: self.cotacao))"
        self.labelDolar.text = "Dolar: US$ \(dolar)"
    }
    

}
