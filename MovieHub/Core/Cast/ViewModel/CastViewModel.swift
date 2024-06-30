//
//  CastViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import Foundation

class CastViewModel: ObservableObject {
    @Published var movie: Movie
    
    @Published var movieCast = [Cast]()
    
    init(movie: Movie) {
        self.movie = movie
        
        Task {
            try await loadMovieCast()
        }
    }
    
    @MainActor
    func loadMovieCast() async throws {
        do {
            let movieCredit = try await MovieDetailService.shared.loadMovieCredits(movieId: movie.id)
            let filteredCast = movieCredit.cast.filter{ $0.order <= 10}
            self.movieCast = filteredCast
        } catch {
            print("Failed to load movie casts: \(error.localizedDescription)")
        }
    }
}
