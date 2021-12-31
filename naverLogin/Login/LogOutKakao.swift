//
//  LogOutKakao.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/29.
//
//
//import UIKit
//import KakaoSDKUser
//
//class LogOutKakao: UIViewController {
//    
//    @IBOutlet weak var nickNameText: UILabel!
//    
//    var logIn = LoginKakao()
//    
//    var nickname: String?
//    var email: String?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUI()
//    }
//
//}
//extension LogOutKakao {
//    @objc private func setUI() {
//
//        // ✅ 사용자 정보 보여주기
////        if let nickname = nickname {
////            nickNameText.text = "\(nickname)님 환영합니다."
//        nickNameText.text = logIn.mynickName
//        }
//        // ✅ 닉네임의 경우 필수동의 항목이라서 else 문이 필요하지 않았다.
//
////        if let emial = email {
////            emailText.text = "\(emial)님 환영합니다."
////        } else {
////            emailText.text = "이메일 정보 수집을 동의하십시오."
////        }
////    }
//}
