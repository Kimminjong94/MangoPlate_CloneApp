//
//  FoodResponse.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import Foundation


struct FoodResponse: Decodable {
    let getSafeRestaurantList: GetSafeRestaurantList
}

struct GetSafeRestaurantList: Decodable {
    let item: [item]
}

struct item: Decodable {
    let biz_nm: String
}


