//
//  ViewController.swift
//  TrabalhandoDadosXML
//
//  Created by Vinicius Luz Souza on 07/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var textViewResultado: UITextView!
    
    
    
    // MARK:- Propriedades
    var dicAluno : [ String: String ] = [:]
    var arrayLista : [[String : String]] = []
    var tagAtual = ""
    var conteudoTag = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewResultado.text = ""
        
        // Indicando o caminho do arquivo que está dentro do pacote
        let caminhoArquivo = Bundle.main.url(forResource: "dados", withExtension: "xml")
        
        // Criando o objeto que fará a interpretação dos dados XML
        let tradutorXML = XMLParser(contentsOf: caminhoArquivo!)
        
        // Implementando o delegate
        tradutorXML?.delegate = self
        
        // Iniciando a tradução
        tradutorXML?.parse()
        
    }


    // MARK:- Actions
    @IBAction func exibirDados(_ sender: UIButton) {
        
        var stringFinal = ""
        
        for lista in arrayLista {
            //textViewResultado.text! += "\(lista)\n"
            
            if lista["nome"] != nil {
                stringFinal += "Nome: \(lista["nome"]!)\n"
            }
            if lista["idade"] != nil {
                stringFinal += "Idade: \(lista["idade"]!)\n\n"
            }
        }
        textViewResultado.text = stringFinal
    }
    


}

// MARK:- Extensão para adoção do protocolo XMLParserDelegate
extension ViewController : XMLParserDelegate {
    
    // Método disparado quando a leitura do documento XML é iniciada
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Iniciou a leitura do XML")
    }
    
    // Método disparado quando a leitura do documento XML é encerrada
    func parserDidEndDocument(_ parser: XMLParser) {
        print("Encerrou a leitura do XML")
        print(arrayLista)
    }
    
    // Método disparado quando uma tag é aberta
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //print("Abriu a tag \(elementName)")
        tagAtual = elementName
        
        if tagAtual == "nome" || tagAtual == "idade" {
            conteudoTag = ""
        }
    }
    
    // Método disparado quando uma tag é fechada
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //print("Fechou a tag \(elementName)")
        
        if tagAtual == "nome" {
            dicAluno["nome"] = conteudoTag
            
            conteudoTag = ""
            tagAtual = ""
        }
        
        if tagAtual == "idade" {
            dicAluno["idade"] = conteudoTag
            
            conteudoTag = ""
            tagAtual = ""
        }
        
        if elementName == "aluno" {
            arrayLista.append(dicAluno)
        }
    }
    
    // Método disparado quando é encontrado algum conteúdo dentro de uma tag
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        //print(string)
        
        if tagAtual == "nome" || tagAtual == "idade" {
            conteudoTag = string
        }
    }
    
    // Método disparado quando um erro de interpretação ocorre
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Erro: \(parseError)")
    }
    
}
