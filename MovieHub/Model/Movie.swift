//
//  Movie.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct TrendingMovies: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}


struct Movie: Identifiable, Decodable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let vote_average: Double
    let poster_path: String
    let backdrop_path: String
    
    var posterURL: URL {
        if let baseURL = URL(string: URLConstant.imageURL) {
            return baseURL.appending(path: poster_path)
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


extension Movie {
    static var MOCK_MOVIE: [Movie] = [
        .init(id: 1, title: "Avengers Endgame", overview: "Great Avengers Movie", vote_average: 7.0, poster_path: "test", backdrop_path: "test")
    ]
}
