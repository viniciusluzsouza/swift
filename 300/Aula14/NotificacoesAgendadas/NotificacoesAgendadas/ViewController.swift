//
//  ViewController.swift
//  NotificacoesAgendadas
//
//  Created by Vinicius Luz Souza on 16/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável pelo trabalho com objetos de interface para notificações
import UserNotifications

class ViewController: UIViewController {

    // MARK:- Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pedindo autorização para exibir notificações
        // Options: é um array de opções relacionadas a notificações, como tipo do corpo e alert sonoro
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { (aceito, erros) in
            
            if aceito {
                print("Temos permissão para disparar notificações")
            } else {
                print("Não temos permissão para disparar notificações")
            }
            
        }
        
        UNUserNotificationCenter.current().delegate = self
        
    }
    
    // MARK:- Actions
    @IBAction func escolherData(_ sender: UIDatePicker) {
        
        let dataSelecionada = sender.date
        agendarNotificacao(naData: dataSelecionada)
        
    }
    
    
    // MARK: Métodos Próprios
    func agendarNotificacao(naData : Date) {
        
        // Objeto que engatilha uma notificação na data selecionada utilizando determinados componentes
        let gatilhoDeData = UNCalendarNotificationTrigger(dateMatching: naData.paraDateComponents, repeats: false)
        
        // Objeto que determina o conteúdo mutável de uma notificação
        let conteudoNotificacao = UNMutableNotificationContent()
        
        // Definindo o título da notificação
        conteudoNotificacao.title = "Notificação Agendada"
        
        // Definindo o subtitulo da notificação
        conteudoNotificacao.subtitle = "Teste de Notificação agendada"
        
        // Definindo o corpo da notificação
        conteudoNotificacao.body = "Notificação local agendada. Teste com agendamento a partir da data indicada. Essa notificação pode ser repetida conforme a escolha do usuário."
        
        // Definindo o som padrão para a notificação
        conteudoNotificacao.sound = UNNotificationSound.default()
        
        // Definindo um identificador de categoria para a nossa notificação
        conteudoNotificacao.categoryIdentifier = "Notificação Teste"
        
        // Criando botões para a notificação
        // Um botão precisa de um identificador, um título e uma sequência opcional de opções
        let acaoOK = UNNotificationAction(identifier: "relembrar", title: "Me lembre mais tarde", options: [])
        
        // Criando uma categoria de notificação, implementando os recursos de notificação criados até esse ponto
        let notificacaoCategoriaTeste = UNNotificationCategory(identifier: "Notificação Teste", actions: [acaoOK], intentIdentifiers: [], options: [])
        
        // Indicando quais categorias serão utilizadas para as notificações
        UNUserNotificationCenter.current().setNotificationCategories([notificacaoCategoriaTeste])
        
        // Criando uma requisição para apresentar nossas notificações
        let requisicao = UNNotificationRequest(identifier: "uepa", content: conteudoNotificacao, trigger: gatilhoDeData)
        
        // Limpando as requisições de notificações anteriores
        // Esses variam de acordo com a necessidade de cada aplicação
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        // Adicionando a nossa requisição a lista de notificações
        UNUserNotificationCenter.current().add(requisicao) { (erros) in
            
            if erros == nil {
                print("Notificação agendada")
            }
            
        }
        
    }
    
    


}

// MARK:- Extensão da classe Date para incluir um método de conversão para DateComponents
extension Date {
    
    var paraDateComponents : DateComponents {
        
        let calendario = Calendar(identifier: .gregorian)
        
        let componentes = calendario.dateComponents(in: .autoupdatingCurrent, from: self)
        
        let novosComponents = DateComponents(calendar: calendario, timeZone: .current, month: componentes.month, day: componentes.day, hour: componentes.hour, minute: componentes.minute)
        
        return novosComponents
    }
    
}


// MARK:- Extensão para adoção do protocolo UNUserNotificationsCenterDelegate
extension ViewController : UNUserNotificationCenterDelegate {
    
    // Método disparado quando acontece uma resposta a uma notificação
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Usuário visualizou a notificação e retornou para a aplicação")
        
        // Reagendando a notificação para daqui a 61 segundos
        if response.actionIdentifier == "relembrar" {
            
            let novaData = Date(timeInterval: 61, since: Date())
            agendarNotificacao(naData: novaData)
            
            print("Reagendou Notificação")
            
        }
        
    }
    
}

