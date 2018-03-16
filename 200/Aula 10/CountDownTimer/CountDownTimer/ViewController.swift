//
//  ViewController.swift
//  CountDownTimer
//
//  Created by Vinicius Luz Souza on 31/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var meuDatePicker: UIDatePicker!
    @IBOutlet weak var labelUnica: UILabel!
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.labelUnica.text = nil
        
        self.meuDatePicker.date = Date(timeIntervalSince1970: 0.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func resgatar(_ sender: UIButton) {
        
        self.labelUnica.text = "\(self.meuDatePicker.countDownDuration)"
        
    }
    
    
    // MARK: - Métodos


}

