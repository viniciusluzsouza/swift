//
//  ViewController.swift
//  ImagePickerSimples
//
//  Created by Vinicius Luz Souza on 28/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Propriedades
    let seletorImagens = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Definindo o tipo de acesso do imagePicker. Pode variar entre camera, fotos salvas, ou memória de fotos
        
        seletorImagens.sourceType = .photoLibrary
        
    }

    
    // MARK:- Actions
    @IBAction func abriAlbum(_ sender: UIButton) {
        present(seletorImagens, animated: true, completion: nil)
    }
    

}

