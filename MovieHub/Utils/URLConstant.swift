//
//  URLConstant.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct URLConstant {
    static let apiKey = "d87f651a6b4efe803d9bb8e7b6cc5871"
    
    static let trendingMoviesURL = "https://api.themoviedb.org/3/trending/movie/day?api_key=\(URLConstant.apiKey)"
    
    static func movieCreditURL(for movieId: Int) -> String {
        return "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(apiKey)"
    }
    
}
