//
//  PickViewController4.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit
import Alamofire



class PickViewController4: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var stores = [Myitem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StoreDataManager().getStoreData(self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func didSuccess(_ response: Store) {
        let data = response.response.body.items.item
        self.stores = data
        self.collectionView.reloadData()
    }
}

//MARK: - Delegate, Datasource

extension PickViewController4: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        cell.nameLabel.text = stores[indexPath.row].bsn_nm
        
        return cell
    }
    
}

