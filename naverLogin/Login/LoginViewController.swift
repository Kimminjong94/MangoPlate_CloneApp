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

class LoginViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var id: UILabel!
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        loginInstance?.delegate = self
    }
    
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
    
    @IBAction func kakaoLogin(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as? TabBarController else { return }
                    navigation.modalPresentationStyle = .overFullScreen
                    self.present(navigation, animated: true, completion: nil)

                    _ = oauthToken
                }
            }
    }
    
    
    @IBAction func logout(_ sender: Any) {
        loginInstance?.requestDeleteToken()
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
    

    
}

