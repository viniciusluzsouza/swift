//
//  ViewController.swift
//  GravadorAudio
//
//  Created by Vinicius Luz Souza on 17/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

// --- Colocar a permissao Privacy-Microphone usage description no info.plist

import UIKit
import AVFoundation

// MARK:- Estrutura SandBox
let caminhoRaiz = NSHomeDirectory()
let caminhoDocuments = (caminhoRaiz as NSString).appendingPathComponent("Documents")
let caminhoArquivo = (caminhoDocuments as NSString).appendingPathComponent("audio.caf")

class ViewController: UIViewController {

    
    // MARK:- Propriedades
    var player : AVAudioPlayer!
    var gravador : AVAudioRecorder!
    
    let urlAudio = URL(fileURLWithPath: caminhoArquivo)
    
    // Dicionário com as configiurações de qualidade do arquivo de áudio
    let dicionarioConfiguracoes : [String : AnyObject] = [
        
        // Definindo a qualidade do áudio
        AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue as AnyObject,
        
        // Definindo a quantidade de bits por segundo do nosso áudio
        AVEncoderBitRateKey : 16 as AnyObject,
        
        // Definindo a quantidade de canais do áudio
        AVNumberOfChannelsKey : 2 as AnyObject,
        
        // Definindo a quantidade de Hertz do áudio
        AVSampleRateKey : 44100.0 as AnyObject
        
    ]
    
    // Quando trabalhamos com múltiplas tarefas de áudio (gravar e tocar), precisamos criar uma sessão de áudio para posteriormente definir qual tarefa essa sessão executará
    let sessaoAudio = AVAudioSession.sharedInstance()
    
    let gerenciadorArquivos = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK:- Actions
    @IBAction func gravar(_ sender: UIButton) {
        
        // Definindo o gravador
        // Utilizamos o try? quando queremos abrir mão da estrutura do{} catch, mas não temos certeza de que o resultado não será nulo
        gravador = try? AVAudioRecorder(url: urlAudio, settings: dicionarioConfiguracoes)
        
        // Indicando qual será o tipo da nossa sessão de áudio
        try? sessaoAudio.setCategory(AVAudioSessionCategoryRecord)
        
        // Deixando a sessão de áudio ativa
        try? sessaoAudio.setActive(true)
        
        // Gravando
        gravador.record()
        
    }
    
    @IBAction func pararGravacao(_ sender: UIButton) {
        
        // Vamos parar a gravação apenas se uma sessão de áudio para gravação estiver ativa
        // Verificando se existe uma sessão de gravação
        if gravador != nil {
            
            // Verificando se o gravador está gravando
            if gravador.isRecording {
                gravador.stop()
            }
            
        }
        
    }
    
    @IBAction func reproduzir(_ sender: UIButton) {
        
        // Verificando se o arquivo existe para ser reproduzido
        if gerenciadorArquivos.fileExists(atPath: caminhoArquivo) {
            
            pararGravacao(sender)
            
            // Definindo o player
            player = try? AVAudioPlayer(contentsOf: urlAudio)
            
            // Definindo a categoria da sessão de áudio
            try? sessaoAudio.setCategory(AVAudioSessionCategoryPlayback)
            
            // Tocando!
            player.play()
            
        }
        
    }
    
    @IBAction func pararReproducao(_ sender: UIButton) {
        
        pararGravacao(sender)
        
        // Verificando se existe uma sessão de play
        if player != nil {
            
            // Verificando se o player está tocando
            if player.isPlaying {
                player.stop()
            }
        }
        
        
    }
    
    @IBAction func apagarGravacao(_ sender: UIButton) {
        
        // Verificando se o arquivo existe
        if gerenciadorArquivos.fileExists(atPath: caminhoArquivo) {
            
            pararReproducao(sender)
            
            // Pensando fora da estrutura sandbox, quando acabamos de gravar um arquivo, o buffer desse arquivo ainda está na memória. Devemos, antes de apagar o arquivo em si, limpar esse buffer. Para tal, vamos verificar se estamos em uma sessão de gravação e a partir dela, limpar essa gravação.
            if gravador != nil {
                gravador.deleteRecording()
            }
            
            // Apagando o arquivo
            try? gerenciadorArquivos.removeItem(at: urlAudio)
            
        }
        
    }
    
}




