//
//  TrendingMovieService.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

class TrendingMovieService {
    
    static let shared = TrendingMovieService()
    
    
    // MARK: - Fetching Trending Movies By Day
    func loadTrendingMovies() async throws -> TrendingResult {
        
        guard let url = URL(string: URLConstant.trendingMoviesURL) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let trendingResult = try JSONDecoder().decode(TrendingResult.self, from: data)
        
        return trendingResult
    }
}
