//
//  ViewController.swift
//  CaptandoDadosContatos
//
//  Created by Vinicius Luz Souza on 08/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController {

    
    // MARK:- Outlets
    @IBOutlet weak var labelNomeCaptado: UILabel!
    
    
    // MARK:- Propriedades
    let janelaContatos = CNContactPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        janelaContatos.delegate = self
        
    }

    
    
    // MARK:- Actions
    @IBAction func escolherContato(_ sender: UIButton) {
        
        present(janelaContatos, animated: true, completion: nil)
        
    }
    

}

// MARK:- Extensão para adoção do protocolo CNContactPickerDelegate
extension ViewController : CNContactPickerDelegate {
    
    // Método disparado quando um contato é escolhido
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        let nomeCaptado = contact.givenName         // Captando o primeiro nome
        let nomeMeioCaptado = contact.middleName    // Captando o nome do meio
        let sobrenomeCaptado = contact.familyName   // Captando o sobrenome
        
        let nomeCompleto = nomeCaptado + " " + nomeMeioCaptado + " " + sobrenomeCaptado
        
        labelNomeCaptado.text = nomeCompleto
        
    }
    
    // Método disparado quando a janela de contatos é cancelada (Prioridade 2)
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancelou a janela de contatos")
    }
    
    // Método disparado quando uma propriedade do contato é selecionada (Prioridade 3)
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
//        print(contactProperty)
//    }
    
    // Método disparado quando vários conttos são selecionados (Prioridade 1)
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        print(contacts)
    }
    
}
