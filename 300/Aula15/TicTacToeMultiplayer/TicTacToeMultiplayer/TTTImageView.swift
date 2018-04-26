//
//  TTTImageView.swift
//  TicTacToeMultiplayer
//
//  Created by Tiago Souza on 07/02/2018.
//  Copyright © 2018 Tiago Souza. All rights reserved.
//

import UIKit

class TTTImageView: UIImageView {

    var jogador : String?
    var ativado : Bool = false
    
    func defJogador(umJogador : String){
        
        jogador = umJogador
        
        if ativado == false {
            
            if umJogador == "X"{
                
                self.image = UIImage(named: "X")
            
            } else {
                
                self.image = UIImage(named: "O")
            }
            
            ativado = true
        }
    }

}
