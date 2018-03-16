//
//  ViewController.swift
//  DesafioDesbloqueiaPersonagemProf
//
//  Created by Vinicius Luz Souza on 08/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

var controle = 0

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var botaoPersonagem1: UIButton!
    @IBOutlet weak var botaoPersonagem2: UIButton!
    @IBOutlet weak var botaoPersonagem3: UIButton!
    @IBOutlet weak var botaoPersonagem4: UIButton!
    @IBOutlet weak var botaoPersonagem5: UIButton!
    @IBOutlet weak var sliderUnico: UISlider!
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.liberarPersonagens(self.sliderUnico)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // MARK: - Actions
    @IBAction func liberarPersonagens(_ sender: UISlider) {
        
        self.botaoPersonagem1.isHidden = sender.value < 0.01
        self.botaoPersonagem2.isHidden = sender.value < 0.2
        self.botaoPersonagem3.isHidden = sender.value < 0.4
        self.botaoPersonagem4.isHidden = sender.value < 0.6
        self.botaoPersonagem5.isHidden = sender.value < 0.8
        
    }
    
    @IBAction func irParaProximaTela(_ sender: UIButton) {
        controle = sender.tag
        self.performSegue(withIdentifier: "segueTela2", sender: nil)
    }
    
    // MARK: - Métodos


}

