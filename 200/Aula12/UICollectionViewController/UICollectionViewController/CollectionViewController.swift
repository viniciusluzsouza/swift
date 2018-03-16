//
//  CollectionViewController.swift
//  UICollectionViewController
//
//  Created by Vinicius Luz Souza on 02/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "celula"

class CollectionViewController: UICollectionViewController {
    
    // MARK: Array de objetos
    var arrayElementos1 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var arrayElementos2 = ["1", "2", "3", "4", "5", "6", "7", "8"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return self.arrayElementos1.count
        } else {
            return self.arrayElementos2.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height))
        
        if (indexPath.section == 0) {
            label.text = self.arrayElementos1[indexPath.item]
        } else {
            label.text = self.arrayElementos2[indexPath.item]
        }
    
        cell.addSubview(label)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

 
}
