//
//  MeuPlayerViewController.swift
//  CapturandoVideo
//
//  Created by Vinicius Luz Souza on 28/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import AVKit

class MeuPlayerViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Garante que a declaração do objeto e a classe se comuniquem
        objDeAcessoOutraViewController = self
        
    }

}
