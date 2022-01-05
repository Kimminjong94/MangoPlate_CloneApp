//
//  MainViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/22.
//

import UIKit
import Alamofire

class MainViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var storeCollectionViewHeight: NSLayoutConstraint!
    
    var images: [String] = ["배너1", "배너2", "배너3", "배너4", "배너5", "배너6"]
    var nowPage: Int = 0
    
    var foods = [item]()
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var foodImages: [String] = ["음식1", "음식2", "음식3", "음식4", "음식5", "음식1", "음식2", "음식3", "음식4", "음식5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Nib Register
        let nibCell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        let bannerCell = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        bannerCollectionView.register(bannerCell, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        
        //Page Control
//        pageControl.numberOfPages = images.count
//        for index in 0..<images.count {
//            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
//            frame.size = scrollView.frame.size
//
//            let imgView = UIImageView(frame: frame)
//            imgView.contentMode = .scaleAspectFit
//            imgView.image = UIImage(named: images[index])
//            self.scrollView.addSubview(imgView)
//        }
//        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
//        self.scrollView.frame.size.width = view.bounds.width
//
        configureItem()
        bannerTimer()
        FoodDataManager().getFoodData(self)

        //Delegate
//        scrollView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
//        self.view.layoutIfNeeded()

    }
    override func viewDidLayoutSubviews() {
        self.changeHeight()
    }
    //Navigation Bar
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
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
//        pageControl.currentPage = Int(pageNumber)
//    }
    // FoodDataManager Response
    func didSuccess(_ response: FoodResponse) {
        let data = response.getSafeRestaurantList.item
        self.foods = data
        self.collectionView.reloadData()
    }
    // MARK: 자동 스크롤
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if self.nowPage == images.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            self.nowPage = 0
            return
        }
        // 다음 페이지로 전환
        self.nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
}

//MARK: - Delegate, Datasource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func changeHeight() {
        self.bannerCollectionViewHeight.constant = self.bannerCollectionView.collectionViewLayout.collectionViewContentSize.height
        self.storeCollectionViewHeight.constant = self.collectionView.collectionViewLayout.collectionViewContentSize.height
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.bannerCollectionView {
            return self.images.count
        } else if collectionView == self.collectionView {
            return self.foods.count
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.bannerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else {return UICollectionViewCell()}
            cell.bannerImg.image = UIImage(named: self.images[indexPath.row])
            return cell
        } else if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainCollectionViewCell else {return UICollectionViewCell()}
            
            cell.nameLabel.text = foods[indexPath.row].biz_nm
            cell.image.image = UIImage(named: "\(foodImages[indexPath.row])")
            
            return cell
        } else  {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.bannerCollectionView {
            let vc = storyboard?.instantiateViewController(withIdentifier: "EventViewController") as? EventViewController
            vc?.modalPresentationStyle = .popover
            self.navigationController?.pushViewController(vc!, animated: true)
//            let vc = EventViewController()
//            vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
//            self.present(vc, animated: true, completion: nil)

        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            vc?.restaurantId = self.foods[indexPath.row].biz_nm!
            vc?.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.bannerCollectionView {
            return CGSize(width: self.collectionView.bounds.width, height: self.bannerCollectionView.bounds.height)
        } else if collectionView == self.collectionView {
            return CGSize(width: self.collectionView.bounds.width / 2, height: 240)
        } else {
            return CGSize(width: 100, height: 100)
        }
    }
    
}
