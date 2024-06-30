//
//  CastDetail.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import Foundation

struct CastDetail: Identifiable, Decodable{
    let id: Int
    let name: String
    let biography: String
}

struct CastCredit: Identifiable, Decodable {
    let cast: [Movie]
    let id: Int
}

extension CastDetail {
    static var MOCK_CASTDETAIL: [CastDetail] = [
        .init(id: 1, name: "Robert Downey Jr", biography: "Great Actor")
    ]
}
