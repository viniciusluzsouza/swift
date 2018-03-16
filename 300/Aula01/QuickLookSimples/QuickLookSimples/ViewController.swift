//
//  ViewController.swift
//  QuickLookSimples
//
//  Created by Vinicius Luz Souza on 26/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Importando o framework resposável por gerar visualizações de arquivos diversos
import QuickLook

class ViewController: UIViewController {
    
    // MARK:- Propriedades
    let visualizador = QLPreviewController()
    
    // MARK:- Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.visualizador.dataSource = self
    }
    
    // MARK:- Actions
    @IBAction func mostrarArquivo(_ sender: UIButton) {
        present(visualizador, animated: true, completion: nil)
    }
    

}

// MARK:- Extensão para adoção do protocolo QLPreviewControllerDataSource
extension ViewController : QLPreviewControllerDataSource {
    
    // Método que define a quantidade de itens a serem exibidos pelo visualizador
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    // Método que define quais serão os arquivos a serem exibidos
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        // Indicando o caminho do arquivo a ser visualizado (URL)
        // Na sequência de propriedades e métodos, Bundle indica o pacote do projeto, forResource indica o nome do arquivo em string e ofType indica a extensão do arquivo em string
        let caminhoArquivo = Bundle.main.path(forResource: "5_Conselhos", ofType: "pdf")
        
        let arquivoURL = URL(fileURLWithPath: caminhoArquivo!)
        
        return arquivoURL as QLPreviewItem
        
    }
    
    
}
