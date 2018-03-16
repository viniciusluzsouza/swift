//
//  ViewController.swift
//  CapturandoVideo
//
//  Created by Vinicius Luz Souza on 28/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável pelo trabalho com o player nativo de áudio e vídeo
import AVKit

// Framework responsável por gerar arquivos de media de diversas extensões como vídeos, áudios e imagens
import MobileCoreServices

// MARK: Propriedades Globais
// Workaround (Gambiarra)
var objDeAcessoOutraViewController = MeuPlayerViewController()

class ViewController: UIViewController {
    
    // MARK:- Propriedades
    let seletorImagens = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK:- Actions
    @IBAction func acessarCam(_ sender: UIBarButtonItem) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            seletorImagens.sourceType = .camera
            seletorImagens.delegate = self
            
            // Definindo o tipo de arquivo a ser captado (.mov)
            seletorImagens.mediaTypes = [kUTTypeMovie as String]
            
            // Alterando o tipo de captura da camera (Photo/Video)
            seletorImagens.cameraCaptureMode = .video
            
            present(seletorImagens, animated: true, completion: nil )
            
        } else {
            print("Camera indisponível")
        }
        
    }
    
    


}

// MARK:- Extensão para adoção dos protocolos UIImagePickerControllerDelegate e UINavigationControllerDelegate
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Guardando o vídeo capturado em um repositório
        let videoURL = info[UIImagePickerControllerMediaURL] as? URL
        
        // Dispensando a janela da camera
        picker.dismiss(animated: true, completion: nil)
        
        // Alocando o video capturado no player
        objDeAcessoOutraViewController.player = AVPlayer(url: videoURL!)
        
        // Reproduzindo o video
        objDeAcessoOutraViewController.player?.play()
        
        
    }
    
}



