//
//  MainViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/22.
//

import UIKit
import Alamofire

class MainViewController: BaseViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var foods = [item]()
    var collectionCell = MainCollectionViewCell()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var images: [String] = ["배너1", "배너2", "배너3", "배너4", "배너5", "배너6"]
    var foodImages: [String] = ["음식1", "음식2", "음식3", "음식4", "음식5", "음식", "음식1", "음식2", "음식3", "음식4", "음식5"]
    var foodName: [String] = []
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItem()
        
        pageControl.numberOfPages = images.count
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.contentMode = .scaleAspectFit
            imgView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imgView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
        let nibCell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        
        FoodRequest().getFoodData(self)

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    private func configureItem() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "map"),
                style: .done,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "magnifyingglass"),
                style: .done,
                target: self,
                action: nil
                )
        ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "부산∨", style: .done, target: self, action: nil)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    func didSuccess(_ response: FoodResponse) {
        
        let data = response.getSafeRestaurantList.item
        self.foods = data
        self.collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        cell.nameLabel.text = foods[indexPath.row].biz_nm
        return cell
    }
    
}
