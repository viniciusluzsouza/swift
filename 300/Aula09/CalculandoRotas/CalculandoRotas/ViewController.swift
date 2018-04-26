//
//  ViewController.swift
//  CalculandoRotas
//
//  Created by Vinicius Luz Souza on 09/03/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var mapa: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mapa.delegate = self
        
        // Definindo as coordenadas de origem e destino
        let coordOrigem = CLLocationCoordinate2DMake(-23.566403, -46.652540)
        let coordDestino = CLLocationCoordinate2DMake(-23.583396, -46.656712)
        
        // Definindo os pontos de ínicio e fim da rota (Placemarks)
        let pontoOrigem = MKPlacemark(coordinate: coordOrigem)
        let pontoDestino = MKPlacemark(coordinate: coordDestino)
        
        // Incluindo os pontos como itens do mapa
        let itemOrigem = MKMapItem(placemark: pontoOrigem)
        let itemDestino = MKMapItem(placemark: pontoDestino)
        
        // Criando os pinos de origem e destino
        let pinoOrigem = MKPointAnnotation()
        pinoOrigem.title = "Quaddro Treinamentos"
        pinoOrigem.coordinate = coordOrigem
        
        let pinoDestino = MKPointAnnotation()
        pinoDestino.title = "Pq. Ibirapuera"
        pinoDestino.coordinate = coordDestino
        
        mapa.addAnnotations([pinoOrigem, pinoDestino])
        
        // Cálculos das direções da rota (requisição de direções)
        let requisicaoDirecoes = MKDirectionsRequest()
        requisicaoDirecoes.source = itemOrigem          // Indicando onde a rota começa
        requisicaoDirecoes.destination = itemDestino    // Indicando onde a rota termina
        requisicaoDirecoes.transportType = .automobile
        
        let direcoes = MKDirections(request: requisicaoDirecoes)
        
        direcoes.calculate { (resposta, erros) in
            
            if erros == nil {
                let rota = resposta?.routes[0]
                
                // Adicionando as linhas da rota respeitando as labels com nomes de ruas e pontos de interesse (aboveRoads)
                self.mapa.add(rota!.polyline, level: .aboveRoads)
                
                // Definindo o retangulo a ser apresentado pelo mapa (zoom)
                // Esse retangulo varia de acordo com o tamanho da rota. Quanto maior a rota, mais longe será o zoom aplocado
                let retangulo = rota!.polyline.boundingMapRect

                // Definindo a região de acordo com o retângulo
                self.mapa.setRegion(MKCoordinateRegionForMapRect(retangulo), animated: true)
                
                // Pegando a distancia
                print(rota!.distance)
                
            }
            
        }
        
    }



}

// MARK:- Extensão para adoção do protocolo MKMapViewDelegate
extension ViewController : MKMapViewDelegate {
    
    // Método que define a renderização da rota
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        // Objeto que fará a renderização da rota em um determinado nível (aboveRoads)
        let renderizador = MKPolylineRenderer(overlay: overlay)
        
        // Definindo a cor da linha da rota
        renderizador.strokeColor = UIColor.blue
        
        // Definindo a espessura da linha da rota
        renderizador.lineWidth = 4.0
        
        return renderizador
        
    }
    
}
