//
//  MovieDetail.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct MovieDetail: Decodable, Identifiable {
    let id: Int
    let title: String
    let runtime: Int
    let overview: String
    let vote_average: Double
    let release_date: String
}

extension MovieDetail {
    static var MOCK_DETAIL: [MovieDetail] = [
        .init(id: 1, title: "Test", runtime: 120, overview: "test", vote_average: 7.0, release_date: "2024-10-10")
    ]
}
