//
//  SplashViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2022/01/05.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        usleep(2000000)
    }

    
    @IBAction func moveToBase(_ sender: UIButton) {
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
