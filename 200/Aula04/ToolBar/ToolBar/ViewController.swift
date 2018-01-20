//
//  ViewController.swift
//  ToolBar
//
//  Created by Vinicius Luz Souza on 19/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var textViewUnica: UITextView!
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textViewUnica.isEditable = false
        self.textViewUnica.text = nil
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    @IBAction func clicouVoltar(_ sender: UIBarButtonItem) {
        self.textViewUnica.text = "Voltar"
    }
    
    @IBAction func clicouPlay(_ sender: UIBarButtonItem) {
        self.textViewUnica.text = "Playar"
    }
    
    @IBAction func clicouAvancar(_ sender: UIBarButtonItem) {
        self.textViewUnica.text = "Avançar"
    }
    
    
    // MARK: - Métodos

}

