//
//  URLConstant.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct URLConstant {
    // MARK: - Base API Key
    static let apiKey = "d87f651a6b4efe803d9bb8e7b6cc5871"
    
    // MARK: - Load Movie or Series API
    static let trendingMoviesURL = "https://api.themoviedb.org/3/trending/movie/day?api_key=\(URLConstant.apiKey)"
    static let onAirSeries = "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(URLConstant.apiKey)"
    
    // MARK: - Load Movie or Series Details API
    static func movieDetailURL(for movieId: Int) -> String {
        return "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)"
    }
    static func seriesDetailURL(for seriesId: Int) -> String {
        return "https://api.themoviedb.org/3/tv/\(seriesId)?api_key=\(apiKey)"
    }
    
    // MARK: - Load Movie or Series Credits API
    static func movieCreditURL(for movieId: Int) -> String {
        return "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(apiKey)"
    }
    static func seriesCreditURL(for seriesId: Int) -> String {
        return "https://api.themoviedb.org/3/tv/\(seriesId)/credits?api_key=\(apiKey)"
    }
    
    // MARK: - Load Movie or Series Image API
    static let imageURL = "https://image.tmdb.org/t/p/w500"
    
}
