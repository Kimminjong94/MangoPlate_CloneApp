//
//  PickViewController4.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit
import Alamofire



class PickViewController4: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var stores = [Myitem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStoreData()
        collectionView.dataSource = self
        collectionView.delegate = self

    }
    
    func didSuccess(_ response: Store) {
        
        let data = response.response.body.items.item
        //느낌상 여기서 건들여야 할것같은데 .....
        //스토어스도 마이아이템 자료형으로 ,, 마이아이템을 담아야함
        self.stores = data
        
//        stores.append(contentsOf: [data])
//        StoreCell().nameLabel?.text = data
        self.collectionView.reloadData()
    }
    
    func getStoreData() {
            let url = "http://apis.data.go.kr/3510500/chinese_restaurant/getList?serviceKey=XOCSn1qJ48M00E3tw8OTGkY5WMa6ifqinWOVMJTVOe5yX7nbm%2FazNu1XhooNP3WRWHdhaKz%2Byxg%2Fc8Bk%2B%2BRWeQ%3D%3D&pageNo=1&numOfRows=10&type=JSON"
            
            let params: Parameters = [
                "serviceKey"  : "XOCSn1qJ48M00E3tw8OTGkY5WMa6ifqinWOVMJTVOe5yX7nbm%2FazNu1XhooNP3WRWHdhaKz%2Byxg%2Fc8Bk%2B%2BRWeQ%3D%3D",
                "pageNo" : 1,
                "numOfRows" : 10,
                "type" : "JSON"
            ]
            
            AF.request(url,
                       method: .get,
                       parameters: params,
                       headers: nil)
                .responseDecodable(of: Store.self) { response in
                    
                switch response.result {
                case .success(let response):
                    debugPrint(response)
                    print("debud resonse\(response)")
//                    let data = response.response.body.items.item[0].bsn_nm
                    self.didSuccess(response)


                    
                case .failure(let error):
                    print("debug get error: \(error.localizedDescription)")
                }
            }

        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
//        cell.nameLabel.text = stores[indexPath.row].response.body.items.item[0].bsn_nm
        cell.nameLabel.text = stores[indexPath.row].bsn_nm
        
        return cell
//    }
}
}
