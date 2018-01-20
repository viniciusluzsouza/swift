//
//  ViewController.swift
//  ImageViewAnimada
//
//  Created by Vinicius Luz Souza on 19/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageViewUnica: UIImageView!
    
    
    // MARK: - Propriedades
    var arrayImagens : [UIImage] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Criando um for para popular o array
        for i in 0...39 {
            
            // Criando o nome da imagem que usaremos para nosso array
            let nomeImagem = "Sprites/imagem_\(i)"      // .png nao precisa especificar
            
            if let imagem = UIImage(named: nomeImagem) {
                self.arrayImagens.append(imagem)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func animar(_ sender: UIButton) {
        // Propriedade que controla a velocidade que a animação será demonstrada
        self.imageViewUnica.animationDuration = 5.0
        
        // Propriedade que control a quantidade de repetições da animação
        self.imageViewUnica.animationRepeatCount = 1
        
        // Propriedade que define o objeto que fornecerá as imagens para a animação
        self.imageViewUnica.animationImages = self.arrayImagens
        
        // Propriedade que define a imagem da imageView
        self.imageViewUnica.image = self.arrayImagens[7]
        
        //Método que inicia a animação
        self.imageViewUnica.startAnimating()
        
    }
    
    // MARK: - Métodos


}

