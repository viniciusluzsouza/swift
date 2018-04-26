//
//  ViewController.swift
//  PlayerVideo
//
//  Created by Vinicius Luz Souza on 17/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável pelo player nativo do iOS
import AVKit

class ViewController: UIViewController {

    // MARK:- Métodos de Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let janelaDestino = segue.destination as! AVPlayerViewController
        //let urlVideo = Bundle.main.url(forResource: "video", withExtension: "mov")
        
        // Executando um vídeo da internet
        let urlVideo = URL(string: "http://goo.gl/8XmNn8")
        
        janelaDestino.player = AVPlayer(url: urlVideo!)
        //janelaDestino.player?.play()         // Reproduzindo direto
    }

}

