//
//  ViewController.swift
//  NavegadorProprio
//
//  Created by Vinicius Luz Souza on 27/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var webViewExibicao: WKWebView!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var btnVoltar: UIBarButtonItem!
    @IBOutlet weak var btnAvancar: UIBarButtonItem!
    
    
    // MARK:- Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldEndereco.delegate = self
        webViewExibicao.navigationDelegate = self
        
        carregarRequisicaoURL(endereco: "google.com.br")
        
    }


    // MARK:- Actions
    @IBAction func irHome(_ sender: UIBarButtonItem) {
        carregarRequisicaoURL(endereco: "google.com.br")
    }
    
    @IBAction func irParaEndereco(_ sender: UIButton) {
        carregarRequisicaoURL(endereco: textFieldEndereco.text!)
        textFieldEndereco.resignFirstResponder()
    }
    
    
    // MARK:- Métodos de UIResponder
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    @IBAction func voltar(_ sender: UIBarButtonItem) {
        if webViewExibicao.canGoBack {
            webViewExibicao.goBack()
        }
    }
    
    @IBAction func avancar(_ sender: UIBarButtonItem) {
        if webViewExibicao.canGoForward {
            webViewExibicao.goForward()
        }
    }
    
    
    // MARK:- Métodos Próprios
    func carregarRequisicaoURL(endereco : String) {
        let stringEndereco = "http://" + endereco
        let urlFinal = URL(string: stringEndereco)
        let requisicaoURL = URLRequest(url: urlFinal!)
        
        webViewExibicao.load(requisicaoURL)
    }
    
    
    
}

// MARK:- Extesão para adoção do protocolo UITextFieldDelegate
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        carregarRequisicaoURL(endereco: textFieldEndereco.text!)
        textFieldEndereco.resignFirstResponder()
        return true
    }
}

// MARK:- Extesão para adoção do protocolo WKNavigationDelegate
extension ViewController : WKNavigationDelegate {
    
    // Método que é disparado quando uma URL começa a ser carregada
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Iniciou o carregamento de uma página")
        
        // Atualizando o estado dos botões com relação a voltar e avançar
        btnVoltar.isEnabled = webView.canGoBack
        btnAvancar.isEnabled = webView.canGoForward
    }
    
    // Método que é disparado quando o carregamento de um URL é finalizado
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // Atualizando o conteúdo da barra de endereço (textField)
        textFieldEndereco.text = webView.url?.absoluteString
        
        // Atualizando o estado dos botões com relação a voltar e avançar
        btnVoltar.isEnabled = webView.canGoBack
        btnAvancar.isEnabled = webView.canGoForward

    }
    
    // Método disparado quandp um erro na nevagação é encontrado. Esse erro pode ser falta de conexão ou um endereço inexistente
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        // Disparando um alerta para avisar sobre a falta de conexão ou endereço errado
        let alerta = UIAlertController(title: "Alerta", message: "Erro ao tentar carregar a página. Verifique o endereço digitado ou sua conexão com a internet.", preferredStyle: .alert)
        
        let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(acaoOK)
        present(alerta, animated: true, completion: nil)
        
        print(error.localizedDescription)
        
    }
    
    
    
}











