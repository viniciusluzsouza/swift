//
//  ViewController.swift
//  Sensores
//
//  Created by Vinicius Luz Souza on 12/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável por captar os sensores de movimento (Acelerômetro e Giroscópio)
import CoreMotion

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var labelX: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var labelZ: UILabel!
    
    @IBOutlet weak var labelRow: UILabel!
    @IBOutlet weak var labelYaw: UILabel!
    @IBOutlet weak var labelPitch: UILabel!
    
    @IBOutlet weak var progressX: UIProgressView!
    @IBOutlet weak var progressY: UIProgressView!
    @IBOutlet weak var progressZ: UIProgressView!
    
    @IBOutlet weak var progressRow: UIProgressView!
    @IBOutlet weak var progressYaw: UIProgressView!
    @IBOutlet weak var progressPitch: UIProgressView!
    
    // MARK:- Propriedades
    let gerenciadorSensores = CMMotionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    
    // MARK:- Actions
    @IBAction func iniciar(_ sender: UIButton) {
        
        // ---- Trabalhando com Acelerômetro ---- //
        // Verificando se o recurso está disponível no dispositivo
        if gerenciadorSensores.isAccelerometerAvailable {
            
            print("Acelerômetro disponível")
            
            // Indicando a velocidade de atualização dos dados do sensor
            gerenciadorSensores.accelerometerUpdateInterval = 0.01
            
            // Captando os dados do sensor e repassando para a interface
            // Todos os dados dos sensores são processados na fila paralela de tarefas. Para que aconteça a atualização dos dados na interface, devemos despachar esses dados para a fila principal. Os métodos para captar esses dados, são dotados dos recursos para realizar essas operações, nesse caso não necessitamos de DispatchQueue.
            gerenciadorSensores.startAccelerometerUpdates(to: .main, withHandler: { (dados, erros) in
                if erros == nil {
                    self.labelX.text = "\(dados!.acceleration.x)"
                    self.labelY.text = "\(dados!.acceleration.y)"
                    self.labelZ.text = "\(dados!.acceleration.z)"
                    
                    let valorXFloat = Float(dados!.acceleration.x)
                    let valorYFloat = Float(dados!.acceleration.y)
                    let valorZFloat = Float(dados!.acceleration.z)
                    
                    self.progressX.progress = valorXFloat
                    self.progressY.progress = valorYFloat
                    self.progressZ.progress = valorZFloat
                    
                }
            })
            
        } else {
            
            print("Acelerômetro indisponível")
            
        }
        
        // ---- Trabalhando com Giroscópio ---- //
        // Verificando se o recurso está disponível no dispositivo
        if gerenciadorSensores.isGyroAvailable {
            
            print("Giroscópio disponível")
            
            // Indicando a velocidade de atualização dos dados do sensor
            gerenciadorSensores.deviceMotionUpdateInterval = 0.01
            
            // Captando os dados do sensor e repassando para a interface
            gerenciadorSensores.startDeviceMotionUpdates(to: .main, withHandler: { (dados, erros) in
                if erros == nil {
                    self.labelRow.text = "\(dados!.attitude.roll)"
                    self.labelYaw.text = "\(dados!.attitude.yaw)"
                    self.labelPitch.text = "\(dados!.attitude.pitch)"
                    
                    let valorRow = Float(dados!.attitude.roll)
                    let valorYaw = Float(dados!.attitude.yaw)
                    let valorPitch = Float(dados!.attitude.pitch)
                    
                    self.progressRow.progress = valorRow
                    self.progressYaw.progress = valorYaw
                    self.progressPitch.progress = valorPitch
                }
            })
            
        } else {
            
            print("Giroscópio indisponível")
            
        }
        
        
        
    }
    
    

}

