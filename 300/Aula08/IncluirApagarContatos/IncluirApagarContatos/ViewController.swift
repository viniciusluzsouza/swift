//
//  ViewController.swift
//  IncluirApagarContatos
//
//  Created by Vinicius Luz Souza on 08/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

/* ---------- Requisitos ----------
 
 - Para alterar a lista de contatos (adicionar ou excluir), é necessária a permissão do usuário. Para tal devemos incluir na info.plist o item: Privacy - Contacts Usage Description. Esse item deve conter uma string explicando o que será feito com os dados de contato.
 
 */


import UIKit
import ContactsUI

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelSobrenome: UILabel!
    @IBOutlet weak var labelTelefone: UILabel!
    
    
    // MARK:- Propriedades
    var flagApagar = false
    let janelaContatos = CNContactPickerViewController()
    var contatoParaApagar = CNMutableContact()

    // MARK:- Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        janelaContatos.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if flagApagar == true{
            
            let requisicaoSalvar = CNSaveRequest()
            let comandosContatos = CNContactStore()
            
            requisicaoSalvar.delete(contatoParaApagar)
            
            let alerta = UIAlertController(title: "Alerta", message: "O Contato selecionado será apagado!", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "Apagar", style: .destructive, handler: { (acao) in
                
                do{
                    
                    try comandosContatos.execute(requisicaoSalvar)
                    
                    print("Contato apagado com sucesso")
                    
                } catch {
                    
                    print("Erro ao apagar o contato")
                    print(error.localizedDescription)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            
            alerta.addAction(acaoOK)
            alerta.addAction(acaoCancelar)
            
            present(alerta, animated: true, completion: nil)
            
            labelNome.text = ""
            labelSobrenome.text = ""
            labelTelefone.text = ""
        }
    }
    
    
    // MARK:- Actions
    @IBAction func selecionar(_ sender: UIButton) {
        
        flagApagar = false
        present(janelaContatos, animated: true, completion: nil)
        
    }
    
    @IBAction func apagar(_ sender: UIButton) {
        
        flagApagar = true
        present(janelaContatos, animated: true, completion: nil)
        
    }
    
}

// MARK:- Extensão para adoção do protocolo CNContactPickerDelegate
extension ViewController : CNContactPickerDelegate {
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        if flagApagar {
            
            // Criando uma cópia [mutável] do contato que deseja apagar para executar as ações
            contatoParaApagar = contact.mutableCopy() as! CNMutableContact
            
        } else {
            
            // Captando os dados do contato
            let nome = contact.givenName
            let sobrenome = contact.familyName
            var telefone = ""
            
            // Verificando se existe ao menos um número de telefone
            let arrayTelefones = contact.phoneNumbers
            
            if arrayTelefones.count > 0 {
                telefone = (arrayTelefones[0].value).stringValue
            }
            
            // Exibindo os dados capturados
            labelNome.text = nome
            labelSobrenome.text = sobrenome
            labelTelefone.text = telefone
            
        }
        
    }
    
}
