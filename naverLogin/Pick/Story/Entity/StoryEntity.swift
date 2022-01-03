//
//  StoryEntity.swift
//  naverLogin
//
//  Created by 김민종 on 2022/01/03.
//

import Foundation


struct Food: Decodable {
    var results: [results]
}

struct results: Decodable {
    var urls: [urls]
}

struct urls: Decodable {
    var thumb: String
}
