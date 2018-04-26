//
//  ViewController.swift
//  MeuPiano
//
//  Created by Vinicius Luz Souza on 13/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    // MARK:- Propriedades
    var audioPlayer = AVAudioPlayer()
    var arrayURLs : [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for numero in 1...13 {
            let nomeNota = "Nota_\(numero)"
            let urlNota = Bundle.main.url(forResource: nomeNota, withExtension: "m4a")
            arrayURLs.append(urlNota!)
        }
        
    }
    
    
    // MARK:- Actions
    @IBAction func tocarNota(_ sender: UIButton) {
        audioPlayer = try! AVAudioPlayer(contentsOf: arrayURLs[sender.tag])
        audioPlayer.play()
    }
    

}

