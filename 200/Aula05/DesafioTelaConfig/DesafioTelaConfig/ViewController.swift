//
//  ViewController.swift
//  DesafioTelaConfig
//
//  Created by Vinicius Luz Souza on 22/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lbTopo: UILabel!
    @IBOutlet weak var lbMeio: UILabel!
    @IBOutlet weak var lbHabilitaConfiguracao: UILabel!
    @IBOutlet weak var lbInverteCores: UILabel!
    @IBOutlet weak var meuSlider: UISlider!
    @IBOutlet weak var meuProgress: UIProgressView!
    @IBOutlet weak var switchConfiguracao: UISwitch!
    @IBOutlet weak var switchCores: UISwitch!
    @IBOutlet weak var meuStepper: UIStepper!
    
    // MARK: - Propriedades

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.switchConfiguracao.isOn = false
        self.habilitouConfiguracao(self.switchConfiguracao)
        self.switchCores.isOn = false
        self.inverteuCores(self.switchCores)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func habilitouConfiguracao(_ sender: UISwitch) {
        if (sender.isOn) {
            self.meuStepper.isEnabled = true
            self.meuSlider.isEnabled = true
            self.switchCores.isEnabled = true
        } else {
            self.meuStepper.isEnabled = false
            self.meuSlider.isEnabled = false
            self.switchCores.isEnabled = false
        }
    }
    
    @IBAction func inverteuCores(_ sender: UISwitch) {
        if (sender.isOn) {
            self.lbTopo.backgroundColor = UIColor.white
            self.lbTopo.textColor = UIColor.black
            self.lbMeio.backgroundColor = UIColor.white
            self.lbMeio.textColor = UIColor.black
            self.lbHabilitaConfiguracao.textColor = UIColor.white
            self.lbInverteCores.textColor = UIColor.white
            super.view.backgroundColor = UIColor.black
        } else {
            self.lbTopo.backgroundColor = UIColor.black
            self.lbTopo.textColor = UIColor.white
            self.lbMeio.backgroundColor = UIColor.black
            self.lbMeio.textColor = UIColor.white
            self.lbHabilitaConfiguracao.textColor = UIColor.black
            self.lbInverteCores.textColor = UIColor.black
            super.view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func acionouStepper(_ sender: UIStepper) {
        self.lbMeio.text = "\(Int(sender.value))"
    }
    
    @IBAction func mexeuSlider(_ sender: UISlider) {
        self.meuProgress.progress = sender.value
    }
    
    
    // MARK: - Métodos


}

