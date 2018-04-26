//
//  ViewController.swift
//  AVFoundationSimples
//
//  Created by Vinicius Luz Souza on 13/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável por reproduzir arquivos de áudio e vídeo
import AVFoundation

class ViewController: UIViewController {
    
    // MARK:- Propriedades
    let urlSom1 = Bundle.main.url(forResource: "som1", withExtension: "m4a")
    
    // Quando trabalhamos com áudios que serão reproduzidos simultâneamente, cada áudio terá o seu próprio AudioPlayer
    let urlSom2 = Bundle.main.url(forResource: "som2", withExtension: "mp3")
    
    // Objeto respoonsável por reproduzir áudios na aplicação
    var audioPlayer = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Preparando o player para a reprodução
        audioPlayer = try! AVAudioPlayer(contentsOf: urlSom1!)
        audioPlayer2 = try! AVAudioPlayer(contentsOf: urlSom2!)
        
        audioPlayer2.play()
        
    }

    // MARK:- Actions
    @IBAction func emitirSom(_ sender: UIButton) {
        audioPlayer.play()
    }
    
}

