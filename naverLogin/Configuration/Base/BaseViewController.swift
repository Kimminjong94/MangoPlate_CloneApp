//
//  BaseViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2022/01/01.
//

import UIKit

class BaseViewController: UITabBarController, UITabBarControllerDelegate {
    let mainViewController = MainViewController()
    let pickViewController = PickViewController()
    let plusViewController = PlusViewController()
    let newsViewController = NewsViewController()
    let myInfo = MyInfo()
    
    
    let mainTabBarItem = UITabBarItem(title: "맛집찾기", image: UIImage(systemName: "탭바111"), tag: 0)
    let pickTabBarItem = UITabBarItem(title: "망고픽", image: UIImage(systemName: "탭바222"), tag: 1)
    let plusTabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "탭바333")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.orange),
                                      tag: 2)
    let newsTabBarItem = UITabBarItem(title: "소식", image: UIImage(systemName: "탭바444"), tag: 3)

    let myInfoTabBarItem = UITabBarItem(title: "내정보", image: UIImage(systemName: "탭바555"), tag: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = UINavigationController(rootViewController: mainViewController)
        let mangoPickVC = UINavigationController(rootViewController: pickViewController)
        let plusVC = UINavigationController(rootViewController: plusViewController)
        let newskVC = UINavigationController(rootViewController: newsViewController)
        let myInfoVC = UINavigationController(rootViewController: myInfo)
        
        plusTabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 27, bottom: 0, right: 27)
        
        mainVC.tabBarItem = mainTabBarItem
        mangoPickVC.tabBarItem = pickTabBarItem
        plusVC.tabBarItem = plusTabBarItem
        newskVC.tabBarItem = newsTabBarItem
        myInfoVC.tabBarItem = myInfoTabBarItem
        //토큰사용 시 사용하기
//        if Constant.MY_TOKEN.isEmpty == false {
//            myInfoVC.tabBarItem = myInfoTabBarItem
//            self.viewControllers = [mainVC, mangoPickVC, plusVC, newskVC, myInfoVC ]
//        }
    

    self.delegate = self
    self.tabBar.tintColor = UIColor.orange
    self.tabBar.unselectedItemTintColor = UIColor.systemGray3
    self.tabBar.backgroundColor = UIColor.white
    }
    
    
}

