//
//  Tela2ViewController.swift
//  DesafioDesbloqueiaPersonagemProf
//
//  Created by Vinicius Luz Souza on 08/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageViewUnica: UIImageView!
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var arrayImagens = [UIImage(named: "coyote.jpg"), UIImage(named: "gaguinho.jpg"), UIImage(named: "mickey.jpg"), UIImage(named: "pateta.jpg"), UIImage(named: "patolino.jpg")]
        self.imageViewUnica.image = arrayImagens[controle - 1]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Métodos

}
