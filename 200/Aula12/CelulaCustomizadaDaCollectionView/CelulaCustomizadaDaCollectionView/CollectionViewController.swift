//
//  CollectionViewController.swift
//  CelulaCustomizadaDaCollectionView
//
//  Created by Vinicius Luz Souza on 02/02/2018.
//  Copyright © 2018 Vinicius Luz Souza. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.register(UINib(nibName: "CelulaBoladona", bundle: nil), forCellWithReuseIdentifier: "celulaBoladona")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaBoladona", for: indexPath) as! CelulaBoladona
    
        cell.labelUnica.text = "Funfou!!"
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

}
