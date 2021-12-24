//
//  FoodResponse.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import Foundation


struct FoodResponse: Decodable {
    
    var PlaceThatDoATasteyFoodSt: [PlaceThatDoATasteyFoodSt]
}

struct PlaceThatDoATasteyFoodSt: Decodable {
    var head: [head]
    var row: [row]
}

struct head: Decodable {
    var list_total_count: Int
    var RESULT: [RESULT]
    var api_version: String
}

struct RESULT: Decodable {
    var CODE: String
    var MESSAGE: String
}

struct row: Decodable {
    var SIGUN_NM: String
    var SIGUN_CD: String
    var RESTRT_NM: String
    var REPRSNT_FOOD_NM: String
    var TASTFDPLC_TELNO: String
    var RM_MATR: String?
    var REFINE_LOTNO_ADDR: String
    var REFINE_ROADNM_ADDR: String
    var REFINE_ZIP_CD: String
    var REFINE_WGS84_LOGT: String
    var REFINE_WGS84_LAT: String
}


