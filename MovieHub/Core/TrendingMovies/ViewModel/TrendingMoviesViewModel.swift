//
//  TrendingMoviesViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

@MainActor
class TrendingMoviesViewModel: ObservableObject {
    
    @Published var trendingMovies = [Movie]()
    
    init() {
        Task {
            try await fetchTrendingMovies()
        }
    }
    
    
    func fetchTrendingMovies() async throws {
        do {
            let trendingResults = try await TrendingMovieService.shared.loadTrendingMovies()
            self.trendingMovies = trendingResults.results
        } catch {
            print("Failed to load trending movies: \(error.localizedDescription)")
        }
    }
}
