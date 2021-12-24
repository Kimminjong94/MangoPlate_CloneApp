//
//  MainViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/22.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    


    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var images: [String] = ["배너1", "배너2", "배너3", "배너4", "배너5", "배너6"]
    var foodImages: [String] = ["음식", "음식", "음식", "음식", "음식", "음식", "음식", "음식", "음식"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .label
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
        let data = response.PlaceThatDoATasteyFoodSt[1].row[2].RESTRT_NM
        self.testLabel.text = data
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodImages.count
        
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        cell.image.image = UIImage(named: foodImages[indexPath.row])
        
            
        
        
        return cell
    }
    
}
