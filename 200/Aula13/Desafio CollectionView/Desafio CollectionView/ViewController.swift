//
//  ViewController.swift
//  Desafio CollectionView
//
//  Created by Vinicius Luz Souza on 05/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionCima: UICollectionView!
    @IBOutlet weak var collectionMeio: UICollectionView!
    @IBOutlet weak var collectionBaixo: UICollectionView!
    
    
    // MARK: - Propriedades
    var arrayAssets1 : [UIImage] = []
    var arrayAssets2 : [UIImage] = []
    var arrayAssets3 : [UIImage] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    
    // MARK: - Métodos
    func setup() {
        self.collectionCima.dataSource = self
        self.collectionMeio.dataSource = self
        self.collectionBaixo.dataSource = self
        
        self.collectionCima.delegate = self
        self.collectionMeio.delegate = self
        self.collectionBaixo.delegate = self
        
        self.carregaImagens()
    }
    
    func carregaImagens() {
        for i in 1...9 {
            let imagem = UIImage(named: "Swift1_\(i)")
            self.arrayAssets1.append(imagem!)
        }
        for i in 1...8 {
            let imagem = UIImage(named: "Swift2_\(i)")
            self.arrayAssets2.append(imagem!)
        }
        for i in 1...10 {
            let imagem = UIImage(named: "Swift3_\(i)")
            self.arrayAssets3.append(imagem!)
        }
    }


}

extension ViewController : UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionCima {
            return self.arrayAssets3.count
        } else if collectionView == self.collectionMeio {
            return self.arrayAssets1.count
        } else {
            return self.arrayAssets2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.collectionCima) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaCima", for: indexPath)
            let image = UIImageView(image: self.arrayAssets3[indexPath.item])
            image.frame = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
            cell.addSubview(image)
            return cell
        } else if ((collectionView == self.collectionMeio)) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaMeio", for: indexPath)
            let image = UIImageView(image: self.arrayAssets1[indexPath.item])
            image.frame = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
            cell.addSubview(image)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaBaixo", for: indexPath)
            let image = UIImageView(image: self.arrayAssets2[indexPath.item])
            image.frame = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
            cell.addSubview(image)
            return cell
        }
        
    }
    
    
    
}

extension ViewController : UICollectionViewDelegate {
    
    
    
}
