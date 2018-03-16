//
//  ViewController.swift
//  CaptandoUmaFotoDoAlbum
//
//  Created by Vinicius Luz Souza on 28/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var imageViewResultado: UIImageView!
    
    
    // MARK:- Propriedades
    let seletorImagens = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        seletorImagens.delegate = self
        seletorImagens.sourceType = .savedPhotosAlbum
    }


    
    // MARK:- Actions
    @IBAction func escolherFoto(_ sender: UIButton) {
        present(seletorImagens, animated: true, completion: nil)
    }
    
}


// MARK:- Extensão para adoção dos protocolos UIImagePickerControllerDelegate e UINavigationControllerDelegate
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Método disparado quando um objeto é escolhido ou captado no imagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let imagemEscolhida = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageViewResultado.image = imagemEscolhida
        }
        
        //let imagemEscolhida = info[UIImagePickerControllerOriginalImage] as! UIImage
        //imageViewResultado.image = imagemEscolhida
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Método disparado quando o imagePicker é cancelado
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}



