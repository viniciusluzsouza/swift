//
//  ViewController.swift
//  PinoPersonalizado
//
//  Created by Vinicius Luz Souza on 09/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

// Framework responsável pelo trabalho com mapas. O Framework MapKit já contém todos os recursos de outro Famework, o CoreLocation, responsável pelo trabalho com localização e GPS.
import MapKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var meuMapa: MKMapView!
    
    
    // MARK:- Propriedades
    var gerenciadorLocal = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurando a precisão da localização
        // Quanto mais preciso for o gerenciador, mais bateria será consumida (best,tenMeters, HundredMeters, kilometer, threeKilometers). Além destas opções, temos a opção que se adapta a velocidade do dispositivo (bestForNavigation)
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        
        // Determinando a região a ser utilizada
        // Ibirapuera: -23.585497, -46.655759
        
        // 1 - Definindo as coordenadas da região
        let coordIbira = CLLocationCoordinate2DMake(-23.585497, -46.655759)
        
        // 2 - Definindo um zoom para a região. Quanto menor for o número, maior será a proximidade do mapa
        let zoom = MKCoordinateSpanMake(0.01, 0.01)
        
        // 3 - Montando a região, que será baseada nas coordenadas + zoom
        let regiao = MKCoordinateRegionMake(coordIbira, zoom)
        
        // 4 - Indicando essa região no mapa
        meuMapa.setRegion(regiao, animated: true)
        
        // ----------------------------------------------- //
        // --------------- Criando um pino --------------- //
        let meuPino = MKPointAnnotation()
        
        // 1 - Indicando um título para o pino
        meuPino.title = "Parque do Ibirapuera"
        
        // 2 - Indicando um subtitulo
        meuPino.subtitle = "Obelisco Herois de 32"
        
        // 3 - Definindo o local do pino
        meuPino.coordinate = coordIbira
        
        // 4 - Adicionando o pino ao mapa
        meuMapa.addAnnotation(meuPino)
        
        // ----------------------------------------------- //
        
        
        
        
        
        
    }
    


}

