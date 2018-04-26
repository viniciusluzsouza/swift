//
//  ViewController.swift
//  DesafioWebServiceFacebook
//
//  Created by Calebe on 02/04/2018.
//  Copyright © 2018 Calebe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var erroLabel: UILabel!
    // Declarar a searchBar
    let barraPesquisa = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Incluir a searchBar na navigation
        self.navigationItem.titleView = self.barraPesquisa
        // Iniciar com o foco no texto
        self.barraPesquisa.becomeFirstResponder()
        // Definir o placeholder
        self.barraPesquisa.placeholder = "Digite um ID de usuário e toque em Search"
        // Ligar o delegate da seachBar
        self.barraPesquisa.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Função disparada ao tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Remover o foco da searchBar
        self.barraPesquisa.resignFirstResponder()
    }

}

extension ViewController: UISearchBarDelegate {
    // Função disparado ao tocar no search barra de pesquisa
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Garantir que um ID foi digitado e verificar que pelo menos 1 caractere foi digitado
        guard let idUsuario = searchBar.text, idUsuario.count > 0 else { return }
        
        // Criar o objeto da URL
        guard let url = URL(string: "https://graph.facebook.com/\(idUsuario)/picture?type=large") else { return }
        
        // Criar a tarefa e disparar
        URLSession.shared.dataTask(with: url) { (dados, resposta, erro) in
            // Garantir que recebemos dados
            if let dadosRecebidos = dados {
                // Criar um objeto UIImage
                let imagem = UIImage(data: dadosRecebidos)
                // Acessar a main queue para alterar a interface
                DispatchQueue.main.async {
                    // Exibir a imagem
                    self.imageView.image = imagem
                }
            }
        }.resume()
    }
}

