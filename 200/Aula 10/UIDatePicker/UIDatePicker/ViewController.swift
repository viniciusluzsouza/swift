//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Vinicius Luz Souza on 31/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var meuDatePicker: UIDatePicker!
    @IBOutlet weak var labelData: UILabel!
    
    
    // MARK: - Propriedades
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.labelData.text = nil
        //
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func mostrar(_ sender: UIButton) {
        
//        // Resgatando a data do picker
//        let dataDoPicker = self.meuDatePicker.date
//
//        // Criando formatador
//        let formatador = DateFormatter()
//        // Setando o style
//        formatador.dateStyle = .full
//        // Resgatando a data em String
//        let stringDataDoPicker = formatador.string(from: dataDoPicker)
//
//        // Colocando na label
//        self.labelData.text = stringDataDoPicker
    }
    
    @IBAction func alterouDatePicker(_ sender: UIDatePicker) {
        // Resgatando a data do picker
        let dataDoPicker = self.meuDatePicker.date
        
        // Criando formatador
        let formatador = DateFormatter()
        // Setando o style
        formatador.dateStyle = .full
        // Resgatando a data em String
        let stringDataDoPicker = formatador.string(from: dataDoPicker)
        
        // Colocando na label
        self.labelData.text = stringDataDoPicker
    }
    
    // MARK: - Métodos

}

