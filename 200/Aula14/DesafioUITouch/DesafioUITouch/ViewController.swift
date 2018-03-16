//
//  ViewController.swift
//  DesafioUITouch
//
//  Created by Vinicius Luz Souza on 06/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lbX: UILabel!
    @IBOutlet weak var lbY: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myImage.isUserInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    
    // MARK: - Métodos
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var toque = UITouch()
        if let toqueTemp = touches.first {
            toque = toqueTemp
        }
        
        if (toque.view == self.myImage) {
            self.myImage.image = UIImage(named: "bravo")
        }
    
    }
    
    // Método que é disparado quando há uma movimentação de toque na tela
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var toque = UITouch()
        if let toqueTemp = touches.first {
            toque = toqueTemp
        }
        
        if (toque.view == self.myImage) {
            let posicaoToque = toque.location(in: self.view)
            self.lbX.text = "\(posicaoToque.x)"
            self.lbY.text = "\(posicaoToque.y)"
            let posicaoAnterior = toque.previousLocation(in: self.view)
            let deltaX = posicaoToque.x - posicaoAnterior.x
            let deltaY = posicaoToque.y - posicaoAnterior.y
            UIView.animate(withDuration: 0.01, animations: {
                self.myImage.frame.origin.x += deltaX
                self.myImage.frame.origin.y += deltaY
            })
            if (self.myImage.frame.origin.x > (self.view.bounds.width/2)) {
                self.view.backgroundColor = .yellow
            } else {
                self.view.backgroundColor = .white
            }
        }
    }
    
    // Método que é disparado quando o toque é finalizado
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var toque = UITouch()
        if let toqueTemp = touches.first {
            toque = toqueTemp
        }
        
        if (toque.view == self.myImage) {
            self.myImage.image = UIImage(named: "feliz")
        }
    }

}

