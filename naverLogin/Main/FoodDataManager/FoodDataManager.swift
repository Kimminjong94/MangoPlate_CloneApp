//
//  FoodRequest.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import Alamofire
import UIKit


class FoodDataManager {
    func getFoodData(_ viewController: MainViewController) {
        AF.request(Constant.BASE_URL,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .validate()
            .responseDecodable(of: FoodResponse.self) { response in
                
                switch response.result {
                case .success(let result):
                    debugPrint(response)
                    print("debud resonse\(response)")
                    viewController.didSuccess(result)
//                    viewController.collectionView.reloadData()
                    //메소드를 구현 후 그시점에서 reloaddata
                    //리로드데이터 다른데 뷰를건들이기 x
                    // 데이터통신만하는부분, 프로토콜로 넘겨줌, 그역할만해야함 위임만하는 역할을 해야함
                    
                case .failure(let error):
                    print("debug get error: \(error.localizedDescription)")
                }
            }
    }
}
