//
//  NewsViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit
import Tabman
import Pageboy

class NewsViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .label
        configureItem()

        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsViewController2") as! NewsViewController2
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsViewController3") as! NewsViewController3
        let vc4 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsViewController4") as! NewsViewController4
            
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)

        
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize

        // Add to view
        addBar(bar, dataSource: self, at: .top)
        
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        bar.indicator.weight = .heavy
        bar.indicator.tintColor = .orange
        bar.indicator.overscrollBehavior = .compress
        bar.indicator.overscrollBehavior = .bounce


    }
    
    private func configureItem() {

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "전체지역∨", style: .done, target: self, action: nil)
    }
    


}

extension NewsViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = "전체 \(index)"
        item.image = UIImage(named: "image.png")

        // ↑↑ 이미지는 이따가 탭바 형식으로 보여줄 때 사용할 것이니 "이미지가 왜 있지?" 하지말고 넘어가주세요.
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
