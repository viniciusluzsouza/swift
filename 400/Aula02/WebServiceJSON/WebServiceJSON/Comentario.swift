//
//  Comentario.swift
//  WebServiceJSON
//
//  Created by Vinicius Luz Souza on 03/04/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class Comentario: Codable {

    var postID : Int?
    var id : Int?
    var nome : String?
    var email : String?
    var texto : String?
    
    // Definir cada chave do JSON para uma variável
    private enum CodingKeys: String, CodingKey {
        case postID = "postID"
        case id
        case nome = "name"
        case email
        case texto = "body"
    }
    
    /*
     {
     "postId": 1,
     "id": 1,
     "name": "id labore ex et quam laborum",
     "email": "Eliseo@gardner.biz",
     "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
     },
     */
    
}

extension Comentario {
    // Função que efetuará o request no servidor e devolverá os comentários
    static func listar(callback : @escaping (_ comentarios : [Comentario]?) -> Void) {
        
        // Garantir que possuímos uma URL válida
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { return }
        
        // Criar a tarefa de carregamento
        // Dica: usar alamofire para fazer as verificações de erros
        let tarefa = URLSession.shared.dataTask(with: url) { (dados, resposta, erro) in
            var comentarios : [Comentario]?
            
            // O defer é um escopo que será somente disparado no final do escopo atual
            defer {
                
                // Acessar a main queue e executar o callback
                DispatchQueue.main.async {
                    callback(comentarios)
                }
                
            }
            
            // Garantir que recebemos os dados
            guard dados != nil else { return }
            
            // Efetuar o decode do JSON para um objeto nativo
            do {
                comentarios = try JSONDecoder().decode([Comentario].self, from: dados!)
            } catch {
                print("Falha no decode do JSON: \(error)")
            }
            
        }
        
        // Executar a tarefa
        tarefa.resume()
    }
    
    func editar(texto: String, callback: @escaping (_ comentario: Comentario?) -> Void) {
        // https://jsonplaceholder.typicode.com/comments/ID_COMENTARIO
        // Garantir que possuimos um ID
        guard let idComentario = self.id else { return }
        
        // Criar objeto da URL
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments/\(idComentario)") else { return }
        
        // Criar o objeto do BODY
        let dadosJSON = ["body": texto]
        
        // Criar o objeto JSON
        var JSONBody: Data?
        do {
            JSONBody = try JSONSerialization.data(withJSONObject: dadosJSON, options: [])
        } catch {
            print("Falha ao criar o JSON")
            return
        }
        
        // Criar o request, objeto que irá unir URL, header, body e método da requisição
        var request = URLRequest(url: url)
        
        // Definir o método do request (GET, POST, PUT, PATCH, DELETE, ...)
        request.httpMethod = "PATCH"    // PATCH pois iremos alterar somente um campo do registro
        
        // Definir o header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // request.setValue("tokend e acesso x", forHTTPHeaderField: "Authorization")
        
        // Definir o body
        request.httpBody = JSONBody
        
        // Criar tarefa
        let tarefa = URLSession.shared.dataTask(with: request) { (dados, resposta, erro) in
            var comentario : Comentario?
            
            defer {
                DispatchQueue.main.async {
                    callback(comentario)
                }
            }
            
            // Garantir que recebemos os dados
            guard dados != nil else { return }
            
            do {
                comentario = try JSONDecoder().decode(Comentario.self, from: dados!)
            } catch {
                print("Falha do decode do JSON: \(error)")
            }
            
        }
        
        // Executar a tarefa
        tarefa.resume()
        
    }
    
}
