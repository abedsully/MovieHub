//
//  MovieDetailsViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?
    @Published var movieCast = [Cast]()
    @Published var movieDirector = String()
    
    @Published var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        
        Task {
            try await loadMovieDetails()
        }
        
        Task {
            try await loadDirector()
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
    func loadDirector() async throws {
        do {
            let movieCredit = try await MovieDetailService.shared.loadMovieCredits(movieId: movie.id)
            let filteredCrew = movieCredit.crew.filter{$0.job == "Director"}
            let director = filteredCrew.first
            self.movieDirector = director?.name ?? ""
        } catch {
            print("Failed to load movie casts: \(error.localizedDescription)")
        }
    }
}
