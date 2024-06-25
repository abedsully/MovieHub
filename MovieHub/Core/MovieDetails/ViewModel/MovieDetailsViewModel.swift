//
//  MovieDetailsViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movieCast = [MovieCast]()
    @Published var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func loadMovieCast() async throws {
        do {
            let movieCredit = try await MovieDetailService.shared.loadMovieCredits(movieId: movie.id)
            self.movieCast = movieCredit.cast
        } catch {
            print("Failed to load movie casts: \(error.localizedDescription)")
        }
    }
}
