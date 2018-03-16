//
//  ViewController.swift
//  VisualizadorImagem
//
//  Created by Vinicius Luz Souza on 26/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

/* ------- Glossário -------
 
 -- Singleton: é pra ter apenas uma instância de um objeto.
 
 -- Singleton é um um tipo de objeto imutável que só pode ser instanciado uma única vez dentro de uma classe. Ou pode ser referenciado diretamente através do nome da classe.
 
 */

import UIKit
import QuickLook

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var imageViewResultado: UIImageView!
    
    
    // MARK:- Propriedades
    var arrayNomesImagens : [String] = []
    let visualizador = QLPreviewController()
    
    // MARK:- Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for numero in 1...4 {
            self.arrayNomesImagens.append("capa\(numero)")
        }
        
        print(self.arrayNomesImagens)
        
        self.visualizador.dataSource = self
        self.visualizador.delegate = self
        
    }

    
    // MARK:- Actions
    @IBAction func escolherImagem(_ sender: UIButton) {
        present(visualizador, animated: true, completion: nil)
    }
    

}

// MARK:- Extensão para adoção do protocolo QLPreviewControllerDataSource
extension ViewController : QLPreviewControllerDataSource {
    
    // Método que define a quantidade de elementos a serem exibidos pelo visualizador
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.arrayNomesImagens.count
    }
    
    // Método que define os dados que farão parte do visualizador
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        // Escolhendo o nome de arquivo atual
        let nomeImagemAtual = self.arrayNomesImagens[index]
        
        // Caminho do arquivo
        let caminhoArquivo = Bundle.main.path(forResource: nomeImagemAtual, ofType: "png")
        
        let arquivoURL = URL(fileURLWithPath: caminhoArquivo!)
        
        return arquivoURL as QLPreviewItem
    }
    
    
}

// MARK:- Extensão para adoção do protocolo QLPreviewControllerDelegate
extension ViewController : QLPreviewControllerDelegate {
    
    // Método disparado quando a janela do Quick Look está prestes a ser dispensada
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        let indice = controller.currentPreviewItemIndex
        let nomeImagem = self.arrayNomesImagens[indice] + ".png"
        
        imageViewResultado.image = UIImage(named: nomeImagem)
        
    }
}






