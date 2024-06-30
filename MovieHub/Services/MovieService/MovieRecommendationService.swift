//
//  MovieRecommendationService.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import Foundation

class MovieRecommendationService {
    static let shared = MovieRecommendationService()
    
    func loadMovieRecommendation(movieId: Int) async throws -> TrendingMovies {
        guard let url = URL(string: URLConstant.movieRecommendationURL(for: movieId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let recommendedMovies = try JSONDecoder().decode(TrendingMovies.self, from: data)
            return recommendedMovies
        } catch {
            print("Failed to decode movie recommendations: \(error.localizedDescription)")
            throw error
        }
    }
}
