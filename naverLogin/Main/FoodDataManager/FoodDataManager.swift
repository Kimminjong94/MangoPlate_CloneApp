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
                    viewController.collectionView.reloadData()
                    
                case .failure(let error):
                    print("debug get error: \(error.localizedDescription)")
                }
            }
    }
}
