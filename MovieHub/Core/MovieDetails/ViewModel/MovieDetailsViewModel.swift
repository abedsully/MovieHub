//
//  MovieDetailsViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?
    @Published var movieCast = [MovieCast]()
    
    @Published var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        
        Task {
            try await loadMovieDetails()
        }
        
        Task {
            try await loadMovieCast()
        }
    }
    
    @MainActor
    func loadMovieDetails() async throws {
        do {
            self.movieDetail = try await MovieDetailService.shared.loadMovieDetails(movieId: movie.id)
        } catch {
            print("Failed to load movie details: \(error.localizedDescription)")
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
