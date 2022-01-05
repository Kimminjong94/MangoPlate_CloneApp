//
//  DetailViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2022/01/03.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var storeId: UILabel!
    @IBOutlet weak var storeImageCollectionView: UICollectionView!
    
    var restaurantId: String?
    var imgList: [String] = ["음식1", "음식2", "음식3", "음식4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.storeId.text = restaurantId
        self.storeImageCollectionView.delegate = self
        self.storeImageCollectionView.dataSource = self
        
        
        self.storeImageCollectionView.register(UINib(nibName: "StoreImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoreImageCollectionViewCell")
        //뷰만들기해서 뷰를따로만들고 셀의구성으로 하고 셀의 파일

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreImageCollectionViewCell", for: indexPath) as? StoreImageCollectionViewCell
        cell?.storeImg.image = UIImage(named: "\(imgList[indexPath.row])")
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.storeImageCollectionView.bounds.width / 2, height: 200)
    }
    //프레임은 어떠한기기든 보이는 방식이다. 가로길이 세로 길이 기기대응해서 오토레이아웃으로 변경하기
    
    
    
}
