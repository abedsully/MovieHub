//
//  MovieDetailService.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

class MovieDetailService {
    static let shared = MovieDetailService()
    
    // MARK: - Fetching Movie Details
    func loadMovieDetails(movieId: Int) async throws -> MovieDetail {
        guard let url = URL(string: URLConstant.movieDetailURL(for: movieId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let movieDetails = try JSONDecoder().decode(MovieDetail.self, from: data)
            return movieDetails
        } catch {
            print("Failed to decode movie details: \(error.localizedDescription)")
            throw error
        }
    }
    
    // MARK: - Fetching Movie Credits (Actors, Actress)
    func loadMovieCredits(movieId: Int) async throws -> MovieCredit {
        guard let url = URL(string: URLConstant.movieCreditURL(for: movieId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let movieCredits = try JSONDecoder().decode(MovieCredit.self, from: data)
            return movieCredits
        } catch {
            print("Failed to decode movie credits: \(error.localizedDescription)")
            throw error
        }
    }
}
