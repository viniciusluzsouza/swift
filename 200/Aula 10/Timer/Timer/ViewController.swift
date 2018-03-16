//
//  ViewController.swift
//  Timer
//
//  Created by Vinicius Luz Souza on 31/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    
    // MARK: - Propriedades
    var temporizador : Timer!
    
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
    @IBAction func iniciar(_ sender: UIButton) {
        
        // timeInterval: O intervalo de tempo em que o timer funcionará
        // target: Onde o método de disparo está declarado
        // selector: O método que ele irá disparar
        // User info: Lugar pra reter informações ou nil
        // repeats: Define se o timer repete a ação ou não
        
        self.temporizador = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(ViewController.metodoDisparadoPeloTimer), userInfo: nil, repeats: true)
        
        
    }
    
    @IBAction func parar(_ sender: UIButton) {
        
        self.temporizador.invalidate()
        
    }
    
    // MARK: - Métodos
    @objc func metodoDisparadoPeloTimer() {
        print("Timer funcionando")
    }

}

