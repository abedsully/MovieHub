//
//  Series.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import Foundation

struct TrendingSeries: Decodable {
    let page: Int
    let results: [Series]
    let total_pages: Int
    let total_results: Int
}

struct Series: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let overview: String
    let vote_average: Double
    let poster_path: String?
    let backdrop_path: String
    
    var posterURL: URL {
        if let baseURL = URL(string: URLConstant.imageURL) {
            return baseURL.appending(path: poster_path ?? "")
        } else {
            return URL(string: "https://example.com/placeholder.jpg")!
        }
    }
    
    var backdropURL: URL {
        if let baseURL = URL(string: URLConstant.imageURL) {
            return baseURL.appending(path: backdrop_path)
        } else {
            return URL(string: "https://example.com/placeholder.jpg")!
        }
    }
}


extension Series {
    static var MOCK_SERIES: [Series] = [
        .init(id: 1, name: "Avengers Endgame", overview: "Great Avengers Movie", vote_average: 7.0, poster_path: "test", backdrop_path: "test")
    ]
}
