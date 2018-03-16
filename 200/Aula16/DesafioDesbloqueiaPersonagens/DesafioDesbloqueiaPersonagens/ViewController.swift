//
//  ViewController.swift
//  DesafioDesbloqueiaPersonagens
//
//  Created by Vinicius Luz Souza on 08/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var btpers1: UIButton!
    @IBOutlet weak var btpers2: UIButton!
    @IBOutlet weak var btpers3: UIButton!
    @IBOutlet weak var btpers4: UIButton!
    @IBOutlet weak var btpers5: UIButton!
    
    
    // MARK: - Propriedades
    var arrayBT : [UIButton] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setup()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func sliderMoveu(_ sender: UISlider) {
        
        for i in 0..<self.arrayBT.count {
            if Int(sender.value)-1 >= i {
                self.arrayBT[i].isHidden = false
            } else {
                self.arrayBT[i].isHidden = true
            }
        }
        
    }
    
    
    // MARK: - Métodos
    func setup() {
        self.mySlider.value = 0.0
        self.btpers1.isHidden = true
        self.btpers2.isHidden = true
        self.btpers3.isHidden = true
        self.btpers4.isHidden = true
        self.btpers5.isHidden = true
        self.arrayBT.append(self.btpers1)
        self.arrayBT.append(self.btpers2)
        self.arrayBT.append(self.btpers3)
        self.arrayBT.append(self.btpers4)
        self.arrayBT.append(self.btpers5)
    }

}

