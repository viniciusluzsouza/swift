//
//  ViewController.swift
//  TrabalhandoGPS
//
//  Created by Vinicius Luz Souza on 09/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var mapa: MKMapView!
    
    
    // MARK:- Propriedades
    var gerenciadorLocal = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.delegate = self
        
        // Determinando a região de inicio
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        let coordQuaddro = CLLocationCoordinate2DMake(-23.5660655, -46.6527825)
        let zoom = MKCoordinateSpanMake(0.001, 0.001)
        let regiao = MKCoordinateRegionMake(coordQuaddro, zoom)
        mapa.setRegion(regiao, animated: true)
        
        // Criando o pino personalizado
        let pinoQuaddro = MKPointAnnotation()
        pinoQuaddro.title = "Quaddro Treinamentos"
        pinoQuaddro.coordinate = coordQuaddro
        
        mapa.addAnnotation(pinoQuaddro)
    }


    // MARK:- Actions
    @IBAction func atualizar(_ sender: UIBarButtonItem) {
        
        // Definindo o tipo de autorização a ser solicitada ao usuário
        // Pedindo autorização, caso não exista
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedAlways && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse {
            
            print("Pedindo autorização")
            gerenciadorLocal.requestWhenInUseAuthorization()
            
        } else {
            
            print("Já temos autorização")
            
            // Definindo a exibição da localização do dispositivo
            mapa.showsUserLocation = true
            
            // Implementando o protocolo delegate
            gerenciadorLocal.delegate = self
            
            // Iniciando a atualização das posições
            gerenciadorLocal.startUpdatingLocation()
            
        }
        
    }
    
    @IBAction func mudarEstilo(_ sender: UISegmentedControl) {
        
        let indice = sender.selectedSegmentIndex
        
        switch indice {
        case 0:
            mapa.mapType = .standard
            
        case 1:
            mapa.mapType = .satellite
            
        case 2:
            mapa.mapType = .hybrid
            
        default:
            break
        }
        
    }
    
    
}

// MARK:- Extensão para adoção do protocolo CLLocationManagerDelegate
extension ViewController : CLLocationManagerDelegate {
    
    // Método disparado quando a localização do dispositivo é alterada
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let ultimaLocalizacao = locations.last
        let zoom = MKCoordinateSpanMake(0.002, 0.002)
        let regiao = MKCoordinateRegionMake(ultimaLocalizacao!.coordinate, zoom)
        mapa.setRegion(regiao, animated: true)
        
        
    }
    
}

// MARK:- Extensão para adoção do protocolo MKMapViewDelegate
// Utilizando o protocolo delegate para personalizar os pinos no mapa
extension ViewController : MKMapViewDelegate {
    
    // Método que define a personalização de pinos
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        } else {
            // Reaproveitando o pino existente para criar um novo pino
            let novoPino = MKMarkerAnnotationView(annotation: mapView.dequeueReusableAnnotationView(withIdentifier: "Pino") as? MKAnnotation, reuseIdentifier: nil)
            
            // Indicando uma letra como ícone do pino
            // *** Caso se opte por utilizar a letra como ícone, possíveis imagens a serem utilizadas como ícones nunca aparecerão.
            //novoPino.glyphText = "Q"
            
            // Definindo uma cor personalizada para o pino
            novoPino.markerTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            
            // Definindo uma cor personalizada para o ícone do pino
            novoPino.glyphTintColor = UIColor.purple
            
            // Definindo imagens png com fundo transparente com ícones.
            novoPino.glyphImage = UIImage(named: "Q20")         // Definindo o ícone menor
            novoPino.selectedGlyphImage = UIImage(named: "Q40") // Definindo o ícone maior
            
            return novoPino
        }
        
    }
    
}





