//
//  StoreDataManager.swift
//  naverLogin
//
//  Created by 김민종 on 2022/01/03.
//

import Foundation
import Alamofire


class StoreDataManager {
    
    func getStoreData(_ viewController: PickViewController4) {
        AF.request(Constant.ChinaFood_BASE_URL,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .responseDecodable(of: Store.self) { response in
                
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



