//
//  ErroDeAcesso.swift
//  TratamentoDeErros
//
//  Created by Vinicius Luz Souza on 15/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import Foundation

enum ErroDeAcesso : Error {
    case loginESenhaErrados
    case senhaErrada
    case loginErrado
}


