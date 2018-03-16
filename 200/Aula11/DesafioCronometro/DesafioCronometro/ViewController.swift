//
//  ViewController.swift
//  DesafioCronometro
//
//  Created by Vinicius Luz Souza on 01/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var myDatePicker: UIPickerView!
    @IBOutlet weak var btIniciar: UIButton!
    
    
    // MARK: - Propriedades
    var arrayHoras : [Int] = []
    var arrayMinutos : [Int] = []
    var arraySegundos : [Int] = []
    var tempoSeg=0, tempoMin=0, tempoHora=0
    var temporizador : Timer!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.preencheArrays()
        self.myDatePicker.delegate = self
        self.myDatePicker.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func iniciarCronometro(_ sender: UIButton) {
        self.tempoHora = self.myDatePicker.selectedRow(inComponent: 0)
        self.tempoMin = self.myDatePicker.selectedRow(inComponent: 1)
        self.tempoSeg = self.myDatePicker.selectedRow(inComponent: 2)
        self.btIniciar.isHidden = true
        self.temporizador = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.decrementa), userInfo: nil, repeats: true)
        
    }
    
    
    // MARK: - Métodos
    func preencheArrays() {
        for i in 0...24 {
            self.arrayHoras.append(i)
        }
        
        for i in 0...59 {
            self.arrayMinutos.append(i)
            self.arraySegundos.append(i)
        }
    }
    
    @objc func decrementa() {
        if self.tempoSeg > 0 {
            self.tempoSeg -= 1
        } else {
            if self.tempoMin > 0 {
                self.tempoSeg = 59
                self.tempoMin -= 1
            } else {
                if self.tempoHora > 0 {
                    self.tempoSeg = 59
                    self.tempoMin = 59
                    self.tempoHora -= 1
                }
            }
        }
        
        self.myDatePicker.selectRow(self.tempoHora, inComponent: 0, animated: true)
        self.myDatePicker.selectRow(self.tempoMin, inComponent: 1, animated: true)
        self.myDatePicker.selectRow(self.tempoSeg, inComponent: 2, animated: true)
        
        if self.tempoSeg == 0 && self.tempoMin == 0 && self.tempoHora == 0 {
            self.btIniciar.isHidden = false
            self.temporizador.invalidate()
        }
        
    }
    

}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.arrayHoras.count
        } else {
            return self.arrayMinutos.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(self.arrayHoras[row]) H"
        } else if component == 1{
            return "\(self.arrayMinutos[row]) Min"
        } else {
            return "\(self.arraySegundos[row]) Seg"
        }
    }
    
    
}

