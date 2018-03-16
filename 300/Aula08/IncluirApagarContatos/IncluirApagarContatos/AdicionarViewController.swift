//
//  AdicionarViewController.swift
//  IncluirApagarContatos
//
//  Created by Vinicius Luz Souza on 08/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import ContactsUI

class AdicionarViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldSobrenome: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    
    
    // MARK:- Actions
    @IBAction func adicionar(_ sender: UIButton) {
        
        // Verificando se os textFields estão preenchidos
        if !(textFieldNome.text!.isEmpty || textFieldSobrenome.text!.isEmpty || textFieldTelefone.text!.isEmpty) {
            let nome = textFieldNome.text
            let sobrenome = textFieldSobrenome.text
            let telefone = textFieldTelefone.text
            
            // Quando captamos um contato da lista de contatos, todas as operações realizadas com esse contato estão sendo realizadas em Thread Safe, ou seja, estamos seguros com relação a não realização de alterações nesse contato.
            // Para trabalhar com um novo contato, criamos um objeto CNMutableContact. Esse objeto é identico a um CNContact, porém permite alterações.
            let novoContato = CNMutableContact()
            
            novoContato.givenName = nome!
            novoContato.familyName = sobrenome!
            
            let novoFone = CNLabeledValue(label: "Mobile", value: CNPhoneNumber(stringValue: telefone!))
            novoContato.phoneNumbers = [novoFone]
            
            // Salvando o novo contato na lista
            let requisicaoSalvar = CNSaveRequest()      // Criando uma requisição para salvar um novo contato
            let comandosContatos = CNContactStore()     // Objeto que contém os comandos para alterar contatos
            
            requisicaoSalvar.add(novoContato, toContainerWithIdentifier: nil)
            
            do {
                try comandosContatos.execute(requisicaoSalvar)
                print("Contato adicionado com sucesso")
            } catch {
                print("Erro ao adicionar contato")
                print(error.localizedDescription)
            }
            
            // Código equivalente ao dismiss. Funciona no contexto de navigation controller
            navigationController?.popViewController(animated: true)
            
        } else {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha os campos corretamente", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alerta.addAction(acaoOK)
            
            present(alerta, animated: true, completion: nil)
        }
        
    }
    
    

}
