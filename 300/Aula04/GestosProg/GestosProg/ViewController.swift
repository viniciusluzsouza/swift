//
//  ViewController.swift
//  GestosProg
//
//  Created by Vinicius Luz Souza on 01/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var viewParaGestos: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Gesto Tap
        // No método inicializador, target indica qual objeto está sendo tocado, e action indica qual método será disparado
        let meuGestoTap = UITapGestureRecognizer(target: self, action: #selector(dispararGestoTap(_:)))
        meuGestoTap.numberOfTapsRequired = 2              // Indicando quantos taps serão necessários
        viewParaGestos.addGestureRecognizer(meuGestoTap)
        
        // Gesto Swipe
        let meuGestoSwipe = UISwipeGestureRecognizer(target: self, action: #selector(dispararGestoSwipe(_:)))
        meuGestoSwipe.direction = .left                   // Indicando para qual direção será o gesto
        meuGestoSwipe.numberOfTouchesRequired = 1         // Indicando a quantidade de dedos
        viewParaGestos.addGestureRecognizer(meuGestoSwipe)
        
        // Gesto Pan
        let meuGestoPan = UIPanGestureRecognizer(target: self, action: #selector(dispararPan(_:)))
        meuGestoPan.minimumNumberOfTouches = 2
        viewParaGestos.addGestureRecognizer(meuGestoPan)
        
        // Gesto Long Press
        let meuGestoLongPress = UILongPressGestureRecognizer(target: self, action: #selector(dispararLongPress(_:)))
        meuGestoLongPress.minimumPressDuration = 1.0
        viewParaGestos.addGestureRecognizer(meuGestoLongPress)
        
        // Gesto Rotation
        let meuGestoRotation = UIRotationGestureRecognizer(target: self, action: #selector(dispararRotation(_:)))
        meuGestoRotation.delegate = self
        viewParaGestos.addGestureRecognizer(meuGestoRotation)
        
        // Gesto Pinch
        let meuGestoPinch = UIPinchGestureRecognizer(target: self, action: #selector(dispararGestoPinch(_:)))
        meuGestoPinch.delegate = self
        viewParaGestos.addGestureRecognizer(meuGestoPinch)
        
    }


    // MARK:- Métodos Próprios
    @objc func dispararGestoTap(_ gestoTap : UITapGestureRecognizer) {
        print("Gesto Tap")
    }
    
    @objc func dispararGestoSwipe(_ gestoSwipe : UISwipeGestureRecognizer) {
        print("Gesto Swipe")
    }
    
    @objc func dispararPan(_ gestoPan : UIPanGestureRecognizer) {
        print("Gesto Pan")
        
        let posicao = gestoPan.location(in: self.view)
        print(posicao)
        
        viewParaGestos.center = posicao
    }
    
    @objc func dispararLongPress(_ gestoLongPress : UILongPressGestureRecognizer) {
        if gestoLongPress.state == .began {
            print("Gesto Long Press")
        }
        
    }
    
    @objc func dispararRotation(_ gestoRotation : UIRotationGestureRecognizer) {
        
        print("Gesto Rotation")
        print(gestoRotation.rotation)
        
        // .view representa a view do objeto de gesto
        // .transform é todo o conjunto de alteração do objeto, composto por rotação, posição e escala (tamanho)
        
        gestoRotation.view?.transform = gestoRotation.view!.transform.rotated(by: gestoRotation.rotation)
        
        // Quando soltarmos o objeto na sua nova rotação, essa rotação passa a ser o angulo 0
        gestoRotation.rotation = 0
        
    }
    
    
    @objc func dispararGestoPinch(_ gestoPinch : UIPinchGestureRecognizer) {
        
        print("Gesto Pinch")
        print(gestoPinch.scale)
        
        gestoPinch.view?.transform = gestoPinch.view!.transform.scaledBy(x: gestoPinch.scale, y: gestoPinch.scale)
        gestoPinch.scale = 1
        
    }
}


// MARK:- Extensão para adoção do protocolo UIGestureRecognizerDelegate
extension ViewController : UIGestureRecognizerDelegate {
    
    // Método que define a utilização de gestos simultâneos
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}









