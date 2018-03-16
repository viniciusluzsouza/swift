//
//  ViewController.swift
//  DesafioTimer
//
//  Created by Vinicius Luz Souza on 01/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var lbContagem: UILabel!
    @IBOutlet weak var btIniciar: UIButton!
    
    // MARK: - Propriedades
    var temporizador : Timer!
    var tempo : Int = 0
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.lbContagem.text = String(self.tempo)
        self.myDatePicker.date = Date(timeIntervalSince1970: 0.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func iniciar(_ sender: UIButton) {
        self.tempo = Int(self.myDatePicker.countDownDuration)
        self.lbContagem.text = "\(self.tempo)"
        self.btIniciar.isHidden = true
        self.temporizador = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.decrementaTemp), userInfo: nil, repeats: true)
    }
    
    
    // MARK: - Métodos
    @objc func decrementaTemp() {
        self.tempo = self.tempo - 1
        self.lbContagem.text = "\(self.tempo)"
        if self.tempo == 0 {
            self.temporizador.invalidate()
            self.btIniciar.isHidden = false
        }
    }

}
