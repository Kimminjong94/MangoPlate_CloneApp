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
    
    
    
    func getFoodData(_ viewController: MainCollectionViewCell) {

        let url = "http://apis.data.go.kr/6260000/BusanSafeRestaurantService/getSafeRestaurantList?serviceKey=XOCSn1qJ48M00E3tw8OTGkY5WMa6ifqinWOVMJTVOe5yX7nbm%2FazNu1XhooNP3WRWHdhaKz%2Byxg%2Fc8Bk%2B%2BRWeQ%3D%3D&pageNo=1&numOfRows=10&resultType=json"

        let queryParam: Parameters = [
            "serviceKey"  : "XOCSn1qJ48M00E3tw8OTGkY5WMa6ifqinWOVMJTVOe5yX7nbm%2FazNu1XhooNP3WRWHdhaKz%2Byxg%2Fc8Bk%2B%2BRWeQ%3D%3D",
            "pageNo" : 1,
            "numOfRows" : 10,
            "resultType" : "json"
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
