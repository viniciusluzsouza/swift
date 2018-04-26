//
//  ViewController.swift
//  MoverObjetoComSensor
//
//  Created by Vinicius Luz Souza on 12/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var objetoParaMover: UIView!
    
    
    // MARK:- Propriedades
    let gerenciadorSensores = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if gerenciadorSensores.isGyroAvailable {
            
            gerenciadorSensores.deviceMotionUpdateInterval = 0.01
            
//            gerenciadorSensores.startGyroUpdates(to: .main, withHandler: { (dados, erros) in
//                if erros == nil {
//                    self.objetoParaMover.center.x += CGFloat(dados!.rotationRate.y)
//                    self.objetoParaMover.center.y += CGFloat(dados!.rotationRate.x)
//                }
//            })
            
            gerenciadorSensores.startDeviceMotionUpdates(to: .main, withHandler: { (dados, erros) in
                if erros == nil {
                    
                    // Movimentando o objeto na horizontal de acordo com o movimento do sensor
                    self.objetoParaMover.center.x += CGFloat(dados!.attitude.roll) * 2
                    
                    // Movimentando o objeto na vertical de acordo com o movimento do sensor
                    self.objetoParaMover.center.y += CGFloat(dados!.attitude.pitch) * 2
                    
                    // Travando o objeto no lado direito/esquerdo a uma distancia de 10 pontos da borda
                    if self.objetoParaMover.center.x > self.view.frame.width - self.objetoParaMover.frame.width / 2 - 10 {
                        self.objetoParaMover.center.x = self.view.frame.width - self.objetoParaMover.frame.width / 2 - 10
                    } else if self.objetoParaMover.center.x < self.objetoParaMover.frame.width / 2 + 10 {
                        self.objetoParaMover.center.x = self.objetoParaMover.frame.width / 2 + 10
                    }
                    
                }
            })
            
        }
        
    }



}

