//
//  MovieDetailService.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

class MovieDetailService {
    static let shared = MovieDetailService()
    
    
    // MARK: - Fetching Movie Credits (Actors, Actress)
    func loadMovieCredits(movieId: Int) async throws -> MovieCredit {
        guard let url = URL(string: URLConstant.movieCreditURL(for: movieId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let movieCredits = try JSONDecoder().decode(MovieCredit.self, from: data)
        
        return movieCredits
    }
}
