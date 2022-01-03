//
//  StoreRequest.swift
//  naverLogin
//
//  Created by 김민종 on 2021/12/25.
//

import Foundation
import Alamofire

struct Store: Decodable {
    let response: response
}

struct response: Decodable {
    let body: body
}
struct body: Decodable {
    let items: items
}
struct items: Decodable {
    let item: [Myitem]
}
struct Myitem: Decodable {
    let bsn_nm: String
    let indutype_nm: String
}

