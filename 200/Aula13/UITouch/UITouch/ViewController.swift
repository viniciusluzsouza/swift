//
//  ViewController.swift
//  UITouch
//
//  Created by Vinicius Luz Souza on 05/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var viewzinha: UIView!
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        
        self.view.isMultipleTouchEnabled = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    
    // MARK: - Métodos
    
    // MARK: UITouch
    
    // Método que é disparado quando um toque na tela é iniciado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Iniciou toque")
        
        var toque = UITouch()
        if let toqueTemp = touches.first {
            toque = toqueTemp
        }
        
        // Exibindo o toque
        //print(toque)
        
        // Verificando a quantidade de toques usados
        //print(touches.count)
        
        // Verificando a view que foi tocada
        //print(toque.view)
        
        let posicaoToque = toque.location(in: self.viewzinha)
        print(posicaoToque)
        
    }
    
    // Método que é disparado quando há uma movimentação de toque na tela
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Movimentou")
    }

    // Método que é disparado quando o toque é finalizado
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Finalizou toque")
    }
    
}

