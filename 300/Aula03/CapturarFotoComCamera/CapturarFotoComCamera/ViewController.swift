//
//  ViewController.swift
//  CapturarFotoComCamera
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
        
    }

    
    // MARK:- Actions
    @IBAction func acessarCam(_ sender: UIBarButtonItem) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            seletorImagens.sourceType = .camera
            present(seletorImagens, animated: true, completion: nil)
        } else {
            print("Camera indisponível nesse dispositivo.")
        }
        
    }
    

}

// MARK:- Extensão para adoção dos protocolos UIImagePickerControllerDelegate e UINavigationControllerDelegate
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imagemCapturada = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageViewResultado.image = imagemCapturada
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}







