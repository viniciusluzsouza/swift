//
//  ViewController.swift
//  UIPickerView
//
//  Created by Vinicius Luz Souza on 30/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var meuPickerView: UIPickerView!
    
    
    // MARK: - Propriedades
    var arrayNomes = ["Vinicius", "Lilica", "Josefina", "Garibaldo", "Florisvaldo"]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.meuPickerView.delegate = self
        self.meuPickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func selecionar3(_ sender: UIButton) {
        self.meuPickerView.selectRow(3, inComponent: 0, animated: true)
    }
    
    
    // MARK: - Métodos

    // MARK: - Métodos de UIPickerViewDataSource
    
    // Define a quantidade de colunas que teremos no pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Define a quantidade de linhas que se tem para cada component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayNomes.count
    }
    
    // MARK: - Métodos de UIPickerViewDelegate
    
    // Método que define o título
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayNomes[row]
    }
    
    //
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Disparou")
    }
    
}

