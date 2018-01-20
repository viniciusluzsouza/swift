//
//  ViewController.swift
//  DesafioGirafas
//
//  Created by Vinicius Luz Souza on 19/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    // MARK: - Propriedades
    var arrayImagens : [UIImage] = []
    let animationDuration = 5.0
    let animationRepeatCount = 1
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 1...13 {
            let nomeImagem = "frame-\(i).gif"

            if let imagem = UIImage(named: nomeImagem) {
                self.arrayImagens.append(imagem)
            }
        }
        
        iniciaImageView(imageView1)
        iniciaImageView(imageView2)
        iniciaImageView(imageView3)
        iniciaImageView(imageView4)
        
        self.imageView1.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func selecionouGirafa(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.imageView1.startAnimating()
            
        case 1:
            self.imageView2.startAnimating()
            
        case 2:
            self.imageView3.startAnimating()
            
        case 3:
            self.imageView4.startAnimating()
            
        default:
            print("errou")
            
        }
        

    }
    
    // MARK: - Métodos
    func iniciaImageView(_ imageView : UIImageView ) {
        imageView.animationDuration = self.animationDuration
        imageView.animationRepeatCount = self.animationRepeatCount
        imageView.animationImages = self.arrayImagens
    }


}

