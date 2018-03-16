//
//  ViewController.swift
//  PickerViewComMaisColunas
//
//  Created by Vinicius Luz Souza on 31/01/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var pickerViewUnico: UIPickerView!
    
    
    // MARK: - Propriedades
    var arrayNomes = ["Vinicius", "Lilica", "Josefina", "Garibaldino"]
    var arraySobrenomes = ["Souza", "Garibaldino", "Lilico"]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var arrayInt : [Int] = []
//        "2018".forEach { (c) in
//            arrayInt.append((String(c) as NSString).integerValue)
//        }
     
        //self.pickerViewUnico.delegate = self
        //self.pickerViewUnico.dataSource = self
        // Ligamos lá pela interface gráfica (Main.storyboard) -- botao direito no elemento, arrastar até a dragon ball
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    
    // MARK: - Métodos


}

// Criando a extensão apenas para organização
extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        // Verificando se estamos na coluna 0
        if component == 0 {
            // Caso estejamos, retornamos a mesma quantidade de elementos presentes no nosso array de nomes
            return self.arrayNomes.count
        } else {
            // Caso nao estejamos na coluna 0, estamos na coluna 1 (já que só temos duas colunas)
            // Então retornamos a quantidade de objetos presentes no nosso array de sobrenomes
            return self.arraySobrenomes.count
        }
    }
    
    
}

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // Verificando se a coluna que está sendo construída é a coluna 0
        if component == 0 {
            // Caso seja, retornamos o objeto respectivo a linha no array de nomes
            return self.arrayNomes[row]
        } else {
            // Caso nao seja a 0, ou seja, é a 1, retornamos o obheto respectivo a linha no array de sobrenomes
            return self.arraySobrenomes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Component: \(component) Linha: \(row)")
    }
    
    
}
