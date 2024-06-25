//
//  Movie.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct TrendingResult: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}


struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String
    let vote_average: Double
    let backdrop_path: String
}
