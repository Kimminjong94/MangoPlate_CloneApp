//
//  LoginKakao.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/29.
//
//
//import UIKit
//import KakaoSDKUser
//import KakaoSDKAuth
//import KakaoSDKCommon
//
//class LoginKakao: UIViewController {
//    
//    var mynickName: String = "홍길동"
//
//    
//    @IBOutlet weak var kakaoAccountImage: UIImageView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUI()
//        setGestureRecognizer()
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        // ✅ 유효한 토큰 검사
//        if (AuthApi.hasToken()) {
//            UserApi.shared.accessTokenInfo { (_, error) in
//                if let error = error {
//                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
//                        //로그인 필요
//                    }
//                    else {
//                        //기타 에러
//                    }
//                }
//                else {
////                    토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
//                    
//                    // ✅ 사용자 정보를 가져오고 화면전환을 하는 커스텀 메서드
//                    self.getUserInfo()
//                    guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "KakaoTabBar") as? KakaoTabBar else { return }
//                    navigation.modalPresentationStyle = .fullScreen
//                    self.present(navigation, animated: true, completion: nil)
//                }
//            }
//        }
//        else {
//            //로그인 필요
//        }
//    }
//}
//extension LoginKakao {
//    
//    // MARK: - Methods
//    
//    private func setUI() {
//        
//        // ✅ 카카오 로그인 이미지 설정
//        
//        kakaoAccountImage.image = UIImage(named: "카카오톡으로")
//        
//        self.navigationController?.navigationBar.isHidden = true
//    }
//    
//    // ✅ 이미지뷰에 제스쳐 추가
//    private func setGestureRecognizer() {
//
//        
//        let loginKakaoAccount = UITapGestureRecognizer(target: self, action: #selector(loginKakaoAccount))
//        kakaoAccountImage.isUserInteractionEnabled = true
//        kakaoAccountImage.addGestureRecognizer(loginKakaoAccount)
//    }
//    
//    func getUserInfo() {
//        // ✅ 사용자 정보 가져오기
//        UserApi.shared.me() {(user, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("me() success.")
//                
//                // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
//                let nickname = user?.kakaoAccount?.profile?.nickname
////                let email = user?.kakaoAccount?.email
//                
//                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogOutKakao") as? LogOutKakao else { return }
//                let kakaoTab = KakaoTabBar()
//                
//                // ✅ 사용자 정보 넘기기
//                self.mynickName = nickname ?? ""
////                nextVC.nickname = self.mynickName
////                nextVC.email = email
////                self.navigationController?.pushViewController(nextVC, animated: true)
//                
////                kakaoTab.modalPresentationStyle = .overFullScreen
////                self.present(kakaoTab, animated: true)
//                
////                guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "KakaoTabBar") as? KakaoTabBar else { return }
////                navigation.modalPresentationStyle = .fullScreen
////                self.present(navigation, animated: true, completion: nil)
//
//            }
//        }
//    }
//    
//    // MARK: - @objc Methods
//    
//    // ✅ 카카오로그인 이미지에 UITapGestureRecognizer 를 등록할 때 사용할 @objc 메서드.
//    // ✅ 카카오톡으로 로그인
//    @objc
//    func loginKakao() {
//        print("loginKakao() called.")
//        
//        // ✅ 카카오톡 설치 여부 확인
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//                    
//                    // ✅ 회원가입 성공 시 oauthToken 저장
//                    let kakoOauthToken = oauthToken
//                    UserDefaults.standard.set(kakoOauthToken, forKey: "KakoOauthToken")
//                    
//                    // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
//                    self.getUserInfo()
//                }
//            }
//        }
//        // ✅ 카카오톡 미설치
//        else {
//            print("카카오톡 미설치")
//        }
//    }
//    
//    // ✅ 카카오로그인 이미지에 UITapGestureRecognizer 를 등록할 때 사용할 @objc 메서드.
//    // ✅ 카카오계정으로 로그인
//    @objc
//    func loginKakaoAccount() {
//        print("loginKakaoAccount() called.")
//        
//        // ✅ 기본 웹 브라우저를 사용하여 로그인 진행.
//        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("loginWithKakaoAccount() success.")
//                
//                // ✅ 회원가입 성공 시 oauthToken 저장
//                 _ = oauthToken
//                
//                // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
//                self.getUserInfo()
//            }
//        }
//    }
//}
