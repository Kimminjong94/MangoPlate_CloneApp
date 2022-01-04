//
//  BaseViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2022/01/02.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .label
        self.view.backgroundColor = .white
    }


}
