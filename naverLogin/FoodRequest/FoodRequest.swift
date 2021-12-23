//
//  FoodRequest.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import Foundation
import Alamofire
import UIKit


class FoodRequest {
    func getFoodData(_ viewController: MainViewController) {
        
        let url = "https://openapi.gg.go.kr/PlaceThatDoATasteyFoodSt"
        
        let queryParam: Parameters = [
            "KEY"  : "cbcbadc5e8da48ef992e6840023e00a9",
            "Type" : "json",
            "pIndex" : 1,
            "pSize" : 1
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: queryParam,
                   headers: nil)
            .responseDecodable(of: FoodResponse.self) { response in
                
            switch response.result {
            case .success(let response):
                debugPrint(response)
                print("debud resonse\(response)")
                viewController.didSuccess(response)
                
            case .failure(let error):
                print("debug get error: \(error.localizedDescription)")
            }
            }
        }
}
