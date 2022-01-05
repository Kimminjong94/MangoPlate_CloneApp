//
//  PickViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import UIKit
import Tabman
import Pageboy

class PickViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PickViewController2") as! PickViewController2
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PickViewController3") as! PickViewController3
        let vc4 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PickViewController4") as! PickViewController4
            
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
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        bar.indicator.weight = .medium
        bar.indicator.tintColor = .orange
        bar.indicator.overscrollBehavior = .compress
        bar.indicator.overscrollBehavior = .bounce
//        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 10
        bar.backgroundColor = .white

    }
}

extension PickViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "Eat딜")
        case 1:
            return TMBarItem(title: "스토리")
        case 2:
            return TMBarItem(title: "Top 리스트")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
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
