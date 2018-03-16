//
//  IMCViewController.swift
//  DesafioTabBar
//
//  Created by Vinicius Luz Souza on 14/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class IMCViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var labelPeso: UILabel!
    @IBOutlet weak var labelAltura: UILabel!
    @IBOutlet weak var labelIMC: UILabel!
    @IBOutlet weak var sliderPeso: UISlider!
    @IBOutlet weak var sliderAltura: UISlider!
    
    
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
    
    // MARK: - Actions
    @IBAction func alterouSlider(_ sender: UISlider) {
        let imc = calculaIMC(altura: self.sliderAltura.value, peso: self.sliderPeso.value)
        self.labelPeso.text = "Peso: \(self.sliderPeso.value)"
        self.labelAltura.text = "Altura: \(self.sliderAltura.value)"
        self.labelIMC.text = "IMC: \(imc)"
    }
    
    // MARK: - Métodos
    func calculaIMC(altura : Float, peso : Float) -> Float {
        return peso / (altura * altura)
    }

}
