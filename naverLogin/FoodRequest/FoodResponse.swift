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
//    let header: header
    let item: [item]
//    let numOfRows: Int
//    let pageNo: Int
//    let totalCount: Int

    }

//    struct header: Decodable {
//        let code: String
//        let message: String
//    }

    struct item: Decodable {
        let biz_nm: String
//        let addrs: String
//        let biz_tel: String
//        let geom: String
}


