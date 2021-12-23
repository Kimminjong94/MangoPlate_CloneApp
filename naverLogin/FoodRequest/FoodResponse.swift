//
//  FoodResponse.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/23.
//

import Foundation


struct FoodResponse: Decodable {

    var row: [row]
}

struct row: Decodable {
    var SIGUN_NM: String
    var SIGUN_CD: Int
    var RESTRT_NM: String
    var REPRSNT_FOOD_NM: String
    var TASTFDPLC_TELNO: Int
    var RM_MATR: String?
    var REFINE_LOTNO_ADDR: String
    var REFINE_ROADNM_ADDR: String
    var REFINE_ZIP_CD: Int
    var REFINE_WGS84_LOGT: Int
    var REFINE_WGS84_LAT: Int
    

}
