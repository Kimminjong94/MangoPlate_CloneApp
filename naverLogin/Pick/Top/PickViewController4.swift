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
    var recordsArray:[Int] = Array()
    
    var limit = 20
    let totalEnteries = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StoreDataManager().getStoreData(self)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        var index = 0
        while index < limit {
            recordsArray.append(index)
            index = index + 1
        }
        
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
        return recordsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        cell.nameLabel.text = stores[indexPath.row].bsn_nm
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == recordsArray.count - 1{
            if recordsArray.count < totalEnteries {
                
                var index = recordsArray.count
                limit = index + 20
                while index < limit {
                    recordsArray.append(index)
                    index = index + 1
                    
                    
                }
                self.perform(#selector(loadTable), with: nil, afterDelay:  1.0)
                
            }
        }
    }
    @objc func loadTable() {
        self.collectionView.reloadData()
    }
        
}

