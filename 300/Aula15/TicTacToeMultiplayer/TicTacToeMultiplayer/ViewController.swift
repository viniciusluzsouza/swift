//
//  ViewController.swift
//  TicTacToeMultiplayer
//
//  Created by Tiago Souza on 07/02/2018.
//  Copyright © 2018 Tiago Souza. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController {
    
    //MARK: Propriedades
    var jogadorCorrente = ""
    
    var meuPeerId : MCPeerID!
    var sessao : MCSession!
    var buscador : MCBrowserViewController!
    var avisador : MCAdvertiserAssistant!
    
    //MARK: Outlets
    @IBOutlet var campos: [TTTImageView]!
    
    //MARK: Métodos de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meuPeerId = MCPeerID(displayName: UIDevice.current.name)
        
        sessao = MCSession(peer: meuPeerId)
        sessao.delegate = self
        
        avisador = MCAdvertiserAssistant(serviceType: "TTT", discoveryInfo: nil, session: sessao)
        avisador!.start()
        
        configurarCampos()
        
        jogadorCorrente = "X"
    }
    
    
    //MARK:- Actions
    @IBAction func conectar(_ sender: UIBarButtonItem) {
        
        if sessao != nil{
            
            buscador = MCBrowserViewController(serviceType: "TTT", session: sessao)
            buscador.delegate = self
            
            present(buscador, animated: true, completion: nil)
        }
    }
    
    @IBAction func iniciarNovoJogo(_ sender: UIBarButtonItem) {
        
        resetarCampos()
        
        let msgDic = ["string" : "novoJogo"]
        
        let msgData = try! JSONSerialization.data(withJSONObject: msgDic, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        try! sessao.send(msgData, toPeers: sessao.connectedPeers, with: .reliable)
    }
    
    //Métodos Próprios
    func configurarCampos() {
        
        //---- Ativar interatividade da imagem
        
        for indice in 0...campos.count - 1{
            
            let gesto = UITapGestureRecognizer(target: self, action: #selector(dispararGesto))
            
            gesto.numberOfTapsRequired = 1
            
            campos[indice].addGestureRecognizer(gesto)
        }
    }
    
    @objc func dispararGesto(umGesto : UITapGestureRecognizer)  {
        
        if sessao.connectedPeers.count != 0 {
        
            let campoTocado = umGesto.view as! TTTImageView
            campoTocado.defJogador(umJogador: jogadorCorrente)
            
            let campoCorrente : [String : AnyObject] = ["campo" : campoTocado.tag as AnyObject, "jogador" : jogadorCorrente as AnyObject]
            
            let dadosParaEnviar = try! JSONSerialization.data(withJSONObject: campoCorrente, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            try! sessao.send(dadosParaEnviar, toPeers: sessao.connectedPeers, with: .reliable)
        }
        
        checarResultados()
       
    }
    
    func checarResultados(){
        
        var ganhador = ""
        
        if campos[0].jogador == "X" && campos[1].jogador == "X" && campos[2].jogador == "X"{
            ganhador = "X"
        } else if campos[0].jogador == "O" && campos[1].jogador == "O" && campos[2].jogador == "O"{
            ganhador = "O"
        } else if campos[3].jogador == "X" && campos[4].jogador == "X" && campos[5].jogador == "X"{
            ganhador = "X"
        } else if campos[3].jogador == "O" && campos[4].jogador == "O" && campos[5].jogador == "O"{
            ganhador = "O"
        } else if campos[6].jogador == "X" && campos[7].jogador == "X" && campos[8].jogador == "X"{
            ganhador = "X"
        } else if campos[6].jogador == "O" && campos[7].jogador == "O" && campos[8].jogador == "O"{
            ganhador = "O"
        } else if campos[0].jogador == "X" && campos[3].jogador == "X" && campos[6].jogador == "X"{
            ganhador = "X"
        } else if campos[0].jogador == "O" && campos[3].jogador == "O" && campos[6].jogador == "O"{
            ganhador = "O"
        } else if campos[1].jogador == "X" && campos[4].jogador == "X" && campos[7].jogador == "X"{
            ganhador = "X"
        } else if campos[1].jogador == "O" && campos[4].jogador == "O" && campos[7].jogador == "O"{
            ganhador = "O"
        } else if campos[2].jogador == "X" && campos[5].jogador == "X" && campos[8].jogador == "X"{
            ganhador = "X"
        } else if campos[2].jogador == "O" && campos[5].jogador == "O" && campos[8].jogador == "O"{
            ganhador = "O"
        } else if campos[0].jogador == "X" && campos[4].jogador == "X" && campos[8].jogador == "X"{
            ganhador = "X"
        } else if campos[0].jogador == "O" && campos[4].jogador == "O" && campos[8].jogador == "O"{
            ganhador = "O"
        } else if campos[2].jogador == "X" && campos[4].jogador == "X" && campos[6].jogador == "X"{
            ganhador = "X"
        } else if campos[2].jogador == "O" && campos[4].jogador == "O" && campos[6].jogador == "O"{
            ganhador = "O"
        }

        if ganhador != ""{
            
            let alerta = UIAlertController(title: "Ganhador!", message: "O Jogador \(ganhador) venceu!", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: { (acao) in
                
                self.resetarCampos()
            })
            
            alerta.addAction(acaoOK)
            
            present(alerta, animated: true, completion: nil)
        }
    }
    
    func resetarCampos() {
        
        for indice in 0...campos.count - 1{
            
            campos[indice].image = nil
            campos[indice].ativado = false
            campos[indice].jogador = ""
        }
        
        jogadorCorrente = "X"
    }
}

extension ViewController : MCBrowserViewControllerDelegate{
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        
        browserViewController.dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        
        browserViewController.dismiss(animated: true, completion: nil)
    }
}

extension ViewController : MCSessionDelegate{
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        let info : [AnyHashable : AnyObject] = ["peerIDJogador" : peerID, "estado" : state.rawValue as AnyObject]

        let estado = info["estado"] as! Int
        
        if estado != MCSessionState.connecting.rawValue{
            
            DispatchQueue.main.async {
                self.navigationItem.title = "Conectado"
            }
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        let info = ["dados" : data, "peerIDJogador" : peerID] as [String : AnyObject]

        let dadoRecebido = info["dados"] as! Data
        
        let mensagem = try! JSONSerialization.jsonObject(with: dadoRecebido, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]

        if mensagem["string"] as? String == "novoJogo"{
            
            let alerta = UIAlertController(title: "Novo Jogo", message: "Um novo jogo será iniciado", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alerta.addAction(acaoOK)
            
            present(alerta, animated: true, completion: nil)
            
            DispatchQueue.main.async {
                self.resetarCampos()
            }
            
            
        } else {
            
            let campo = mensagem["campo"] as? Int
            
            let jogador = mensagem["jogador"] as? String
            
            DispatchQueue.main.async {
                
                if campo != nil && jogador != nil{
                    
                    self.campos[campo!].jogador = jogador
                    self.campos[campo!].defJogador(umJogador: jogador!)
                    
                    if jogador == "X"{
                        
                        self.jogadorCorrente = "O"
                        
                    } else {
                        
                        self.jogadorCorrente = "X"
                    }
                    
                    self.checarResultados()
                }
            }
        }
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}


