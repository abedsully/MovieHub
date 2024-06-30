//
//  MovieRecommendationView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import SwiftUI

struct MovieRecommendationView: View {
    @ObservedObject var viewModel: MovieRecommendationViewModel
    
    var movie: Movie {
        return viewModel.movie
    }
    
    init(movie: Movie){
        self.viewModel = MovieRecommendationViewModel(movie: movie)
    }
    
    
    var body: some View {
        HStack {
            ScrollView(.horizontal){
                HStack {
                    ForEach(viewModel.recommendedMovies) { movie in
                        NavigationLink(value: movie) {
                            MoviePoster(movie: movie, size: .poster)
                        }
                    }
                }
                .navigationDestination(for: Movie.self) { movie in
                    MovieDetailsView(movie: movie)
                }
            }
        }
    }
}



#Preview {
    MovieRecommendationView(movie: Movie.MOCK_MOVIE[0])
}
