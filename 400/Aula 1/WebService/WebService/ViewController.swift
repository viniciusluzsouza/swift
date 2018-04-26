//
//  ViewController.swift
//  WebService
//
//  Created by Calebe on 02/04/2018.
//  Copyright © 2018 Calebe. All rights reserved.
//

/*
 WebService - Aplicação com a premissa de integrar diferentes sistemas.
 
 SOAP: É um protocolo de comunicação que trabalha em XML.
 
 <?xml version="1.0"?>
 <soap:Envelope xmlns:soap="http://www.w3.org/2001/12/soap-envelope" soap:encodingStyle="http://www.w3.org/2001/12/soap-encoding">
     <soap:Body xmlns:m="https://api.quaddro.com.br/cursos">
         <m:GetQuantidadeDeCursos>
             <m: Quantidade>20</m: Quantidade>
         </m:GetQuantidadeDeCursos>
     </soap:Body>
 </soap:Envelope>
 
 REST: É uma arquitetura de comunicação que trabalha em cima do protocolo HTTP. Normalmente utilizado com JSON.
 
 XML:
 <?xml version="1.0" encoding="UTF-8"?>
 <quantidade> 20 </quantidade>
 
 JSON:
 {"quantidade": 20}
 
 
 O protocolo HTTP:
 
 - URI:
 
            URL                   URN
 ______________________________ ______
 https://api.quaddro.com.br:443/cursos
 _____________________________________
               URI
 
 - Porta:
 Normalmente a porta de uma API é a 80 (HTTP) ou 443 (HTTPS), porém as portas vão de 1 a 65535. As portas conhecidas vão de 1 a 1023.
 
 - Header:
 Cabeçalho da requisição, onde as principais informações da conexão são enviadas.
 
 Content-Type: Informa o tipo MIME do arquivo. (https://www.iana.org/assignments/media-types/media-types.xhtml)
 Content-Length: Informa o tamanho do arquivo.
 Authorization: Informa o token de acesso, para APIs seguras.
 Accept-Language: Informa para a API a preferência de idioma do client.
 
 - Body:
 Onde são enviado os dados, JSON, imagem, txt, ...
 
 - Método:
 GET - Requisições de leitura
 https://api.quaddro.com.br:443/cursos
 https://api.quaddro.com.br:443/cursos/1
 POST - Requisições de criação, alteração, remoção, ...
 https://api.quaddro.com.br:443/cursos/criar
 https://api.quaddro.com.br:443/cursos/1/remover
 https://api.quaddro.com.br:443/cursos/1/editar
 
 Create - POST
 Read   - GET
 Update - PUT - Substitui todos os campos na base
 Delete - DELETE
 
 PATCH - Novo método - Atualiza somente os dados enviados (https://tools.ietf.org/html/rfc5789)
 
 - Código de resposta (https://httpstatuses.com | https://http.cat | https://httpstatusdogs.com):
 2xx - Sucesso
 3xx - Redirecionamento (pode servir para informar que o client já possuí o dado no cache)
 4xx - Erro do client
 5xx - Erro do server
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func carregarImagem(_ sender: UIButton) {
        // Resgatar a escala da tela
        let scale = UIScreen.main.scale
        
        // Resgatar as dimensões da imageView
        let largura = Int(self.imagemImageView.frame.width * scale)
        let altura = Int(self.imagemImageView.frame.height * scale)
        
        // Criar a URI (junção de URL e URN)
        let uri = "https://lorempixel.com/\(largura)/\(altura)/"
        // No caso de trabalharmos com APIs não seguras (HTTP), devemos incluir uma exceção no Info.plist:
        // NSAPPTransportSecurity > NSAllowsArbitraryLoads > YES

        // Criar um objeto URL
        guard let url = URL(string: uri) else { return }
        
        // Criar a sessão que fará o carregamento da imagem
        let sessao = URLSession(configuration: .default)
        
        // Exibir o indicador de conexão
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // Criar a tarefa de carregamento da imagem
        let tarefa = sessao.dataTask(with: url) { (dados: Data?, resposta: URLResponse?, erro: Error?) in
            // Remover o indicador de conexão
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            // Resgatar a resposta HTTP
            if let respostaHTTP = resposta as? HTTPURLResponse {
                print("Código de status: \(respostaHTTP.statusCode)")
                print("MIME type do arquivo: \(respostaHTTP.mimeType ?? "sem arquivo")")
            }
            
            // Exibir o erro
            if let erroRecebido = erro {
                print("Falha na requisição: \(erroRecebido.localizedDescription)")
            }
            
            // Verificar se recebemos dados
            if let dadosRecebidos = dados {
                // Criar um objeto imagem
                let imagem = UIImage(data: dadosRecebidos)
                // Acessar a fila de tarefas principal, para alterar a interface
                DispatchQueue.main.async {
                    // Exibir a imagem na imageView
                    self.imagemImageView.image = imagem
                }
            }
        }
        
        // Disparar a requisição da tarefa
        tarefa.resume()
    }
    
}






