//
//  ViewController.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/22.
//
import Foundation
import UIKit
import NaverThirdPartyLogin
import Alamofire
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

class LoginViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var id: UILabel!
    
    @IBOutlet weak var loginWithKakaoImageView: UIImageView!
    
    
    
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        loginInstance?.delegate = self
        setUI()
        setGestureRecognizer()
        
    }
    //MARK: -네이버로그인
    // 로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success login")
        getInfo()
    }
    // referesh token
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        loginInstance?.accessToken
    }
    // 로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("log out")
    }
    // 모든 error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
    @IBAction func login(_ sender: Any) {
        
        loginInstance?.requestThirdPartyLogin()
            //로그인 시 다른 뷰컨트롤러로 이동
        
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as? TabBarController else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.present(navigation, animated: true, completion: nil)
        

    }
    // RESTful API, id가져오기
    func getInfo() {
      guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
      
      if !isValidAccessToken {
        return
      }
      
      guard let tokenType = loginInstance?.tokenType else { return }
      guard let accessToken = loginInstance?.accessToken else { return }
        
      let urlStr = "https://openapi.naver.com/v1/nid/me"
      let url = URL(string: urlStr)!
      
      let authorization = "\(tokenType) \(accessToken)"
      
      let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
      
      req.responseJSON { response in
        guard let result = response.value as? [String: Any] else { return }
        guard let object = result["response"] as? [String: Any] else { return }
        guard let name = object["name"] as? String else { return }
        guard let email = object["email"] as? String else { return }
        guard let id = object["id"] as? String else {return}
        
        print(email)
        
        self.nameLabel.text = "\(name)"
        self.emailLabel.text = "\(email)"
        self.id.text = "\(id)"
      }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // ✅ 유효한 토큰 검사
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
//                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
//
//                    // ✅ 사용자 정보를 가져오고 화면전환을 하는 커스텀 메서드
//                    self.getUserInfo()
//                }
//            }
//        }
//        else {
//            //로그인 필요
//        }
    }
}
//MARK: - 카카오로그인

extension LoginViewController {
    
    // MARK: - Methods
    
    private func setUI() {
        
        // ✅ 카카오 로그인 이미지 설정
 
        loginWithKakaoImageView.contentMode = .scaleAspectFit
        loginWithKakaoImageView.image = UIImage(named: "카카오톡으로")
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // ✅ 이미지뷰에 제스쳐 추가
    private func setGestureRecognizer() {

        
        let loginKakaoAccount = UITapGestureRecognizer(target: self, action: #selector(loginKakaoAccount))
        loginWithKakaoImageView.isUserInteractionEnabled = true
        loginWithKakaoImageView.addGestureRecognizer(loginKakaoAccount)
    }
    
    private func getUserInfo() {
        // ✅ 사용자 정보 가져오기
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")

                
                // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
                let nickname = user?.kakaoAccount?.profile?.nickname
                let email = user?.kakaoAccount?.email
                
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MyInfo") as? MyInfo else { return }
                
                let myVC = TabBarController()
                
                
                
                print("\(nickname)")
                // ✅ 사용자 정보 넘기기
                
//                nextVC.nickname = nickname
                nextVC.kakaoNickname = nickname
                nextVC.myemail = email
                
                self.navigationController?.pushViewController(nextVC, animated: true)
                
//                guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as? TabBarController else { return }
//                navigation.modalPresentationStyle = .overFullScreen
//                self.present(navigation, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - @objc Methods
    
    // ✅ 카카오로그인 이미지에 UITapGestureRecognizer 를 등록할 때 사용할 @objc 메서드.
    // ✅ 카카오톡으로 로그인
    @objc
    func loginKakao() {
        print("loginKakao() called.")
        
        // ✅ 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // ✅ 회원가입 성공 시 oauthToken 저장
                    let kakoOauthToken = oauthToken
                    UserDefaults.standard.set(kakoOauthToken, forKey: "KakoOauthToken")
                    
                    // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
                    self.getUserInfo()
                }
            }
        }
        // ✅ 카카오톡 미설치
        else {
            print("카카오톡 미설치")
        }
    }
    
    // ✅ 카카오로그인 이미지에 UITapGestureRecognizer 를 등록할 때 사용할 @objc 메서드.
    // ✅ 카카오계정으로 로그인
    @objc
    func loginKakaoAccount() {
        print("loginKakaoAccount() called.")
        
        // ✅ 기본 웹 브라우저를 사용하여 로그인 진행.
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                self.getUserInfo()

                guard let mainTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as? TabBarController else{
                    return
                }
                self.changeRootViewController(mainTabBarController)
                
                // ✅ 회원가입 성공 시 oauthToken 저장
                 _ = oauthToken
                
                // ✅ 사용자정보를 성공적으로 가져오면 화면전환 한다.
            }
        }
    }
    
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
}

