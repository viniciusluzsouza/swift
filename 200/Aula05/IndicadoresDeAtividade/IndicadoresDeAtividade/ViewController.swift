//
//  ViewController.swift
//  IndicadoresDeAtividade
//
//  Created by Vinicius Luz Souza on 22/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var meuActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var meuSwitch: UISwitch!
    @IBOutlet weak var meuProgressView: UIProgressView!
    @IBOutlet weak var meuStepper: UIStepper!
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Propriedade que define o valor do nosso progresso
        self.meuProgressView.progress = 0.0
        
        // Propriedade que define se o nosso activityIndicator ficará escondido quando estiver parado
        self.meuActivityIndicator.hidesWhenStopped = true
        
        // Alterando a escala do stepper
        self.meuStepper.minimumValue = 0.0
        self.meuStepper.maximumValue = 10.0
        
        self.meuSwitch.isOn = false
        self.alterouSwitch(self.meuSwitch)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func alterouSwitch(_ sender: UISwitch) {
        // Verificando o nosso switch
        if (sender.isOn) {
            // Caso o mesmo esteja on
            // Começamos a animar o nosso activityIndicator
            self.meuActivityIndicator.startAnimating()
        } else {
            // Caso ele não esteja on (ou seja, está off)
            // Paramos a animação do nosso activityIndicator
            self.meuActivityIndicator.stopAnimating()
        }
    }
    
    @IBAction func alterouStepper(_ sender: UIStepper) {
        self.meuProgressView.progress = Float(sender.value / 10.0)
    }
    
    // MARK: - Métodos

}

