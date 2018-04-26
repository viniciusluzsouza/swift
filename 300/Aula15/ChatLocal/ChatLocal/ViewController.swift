//
//  ViewController.swift
//  ChatLocal
//
//  Created by Vinicius Luz Souza on 19/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável pela conexão entre dispositivos de forma local, permitindo a troca de dados
import MultipeerConnectivity

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var textFieldMensagem: UITextField!
    @IBOutlet weak var textViewHistorico: UITextView!
    
    
    // MARK:- Propriedades
    var buscador : MCBrowserViewController!
    var avisador : MCAdvertiserAssistant!
    var sessao : MCSession!
    var meuPeerID : MCPeerID!
    
    let tipoDeServico = "chat"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldMensagem.delegate = self
        textViewHistorico.text = ""
        
        // Iniciando o PeerID
        meuPeerID = MCPeerID(displayName: UIDevice.current.name)
        
        // Iniciando a sessão
        sessao = MCSession(peer: meuPeerID)
        sessao.delegate = self
        
        // Iniciando o buscador
        buscador = MCBrowserViewController(serviceType: tipoDeServico, session: sessao)
        buscador.delegate = self
        
        // Iniciando o avisador
        avisador = MCAdvertiserAssistant(serviceType: tipoDeServico, discoveryInfo: nil, session: sessao)
        
        // Pedir para o avisador iniciar as atividades de avisar quando um convite é recebido
        avisador.start()
        
    }
    
    // MARK:- Actions
    @IBAction func buscar(_ sender: UIButton) {
        
        // Exibindo o buscador
        present(buscador, animated: true, completion: nil)
        
        
    }
    
    
    // MARK:- Métodos Próprios
    // Método a ser utilizado tanto no envio, quanto no recebimento de mensagens
    func tratarMensagem(mensagem : String, doPeer : MCPeerID) {
        
        var textoFinal = ""
        
        // Tratando a mensagem a ser enviada
        if doPeer == meuPeerID {
            textoFinal = "Eu: \(mensagem)\n"
        }
        // Tratando a mensagem a ser recebida
        else {
            textoFinal = "\(doPeer.displayName): \(mensagem)\n"
        }
        
        textViewHistorico.text! += textoFinal
        
    }
    
    // MARK:- Métodos de UIResponder
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }

}

// MARK:- Extensão para adoção do protocolo UITextFieldDelegate
extension ViewController : UITextFieldDelegate {
    
    // Método disparado quando a tecla return é pressionada num textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !(textFieldMensagem.text!.isEmpty) {
            let mensagem = textFieldMensagem.text!
            textFieldMensagem.text = ""
            
            // Para enviar qualquer tipo de dado, o dado deve estar em bytes. Para tal, utilizamos um objeto do tipo Data()
            let dadoEmBytes = mensagem.data(using: String.Encoding.utf8)
            
            // Tentando executar o comando de envio de dados entre peers
            do {
                try sessao.send(dadoEmBytes!, toPeers: sessao.connectedPeers, with: .reliable)
                print("Mensagem enviada")
            } catch {
                print("Erro ao enviar a mensagem")
                print(error.localizedDescription)
            }
            
            tratarMensagem(mensagem: mensagem, doPeer: meuPeerID)
        }
        
        textFieldMensagem.resignFirstResponder()
        return true
        
    }
    
}

// MARK:- Extensão para adoção do protocolo MCBrowserViewControllerDelegate
extension ViewController : MCBrowserViewControllerDelegate {
    
    // Método disparado quando a janela do buscador é finalizada com algum tipo de conexão
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        print("Apertou Done")
        browserViewController.dismiss(animated: true, completion: nil)
        
    }
    
    // Método disparado quando a janela do buscador é cancelada
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        print("Apertou Cancel")
        browserViewController.dismiss(animated: true, completion: nil)
    }
    
}

// MARK:- Extensão para adoção do protocolo MCSessionDelegate
extension ViewController : MCSessionDelegate {
    
    // Método disparado quando o status de conexão de um peer é alterado
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        var statusConexao = ""
        
        switch state {
        case .connected:
            statusConexao = "Conectado"
        case .connecting:
            statusConexao = "Conectando"
        case .notConnected:
            statusConexao = "Desconectado"
        default:
            break
        }
        
        print()
        print("Status de conexão do usuário \(peerID.displayName) foi alterado para \(statusConexao)")
        print()
    }
    
    // Método disparado quando um dado é recebido
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        // Todo dado recebido através do multipeerConectivity, é recebido em globalQueue. Caso deseje utilizar essa dado na interface, o dado deverá ser despachado para mainQueue.
        
        let mensagemRecebida = String(data: data, encoding: String.Encoding.utf8)
        DispatchQueue.main.async {
            self.tratarMensagem(mensagem: mensagemRecebida!, doPeer: peerID)
        }
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
}






