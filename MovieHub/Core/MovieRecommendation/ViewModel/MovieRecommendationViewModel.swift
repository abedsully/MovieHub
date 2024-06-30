//
//  MovieRecommendationViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import Foundation

@MainActor
class MovieRecommendationViewModel: ObservableObject {
    @Published var movie: Movie
    @Published var recommendedMovies = [Movie]()
    
    init(movie: Movie) {
        self.movie = movie
        
        Task {
            try await loadMovieRecommendations()
        }
    }
    
    @MainActor
    func loadMovieRecommendations() async throws {
        do {
            let recommendedResult = try await MovieRecommendationService.shared.loadMovieRecommendation(movieId: movie.id)
            self.recommendedMovies = recommendedResult.results
        } catch {
            print("Failed to load movie recommendations: \(error.localizedDescription)")
        }
    }
}
