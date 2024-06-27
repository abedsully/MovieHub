//
//  MoviePoster.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/27/24.
//

import SwiftUI

struct MoviePoster: View {
    let movie: Movie
    let size: MovieCardSize
    
    var body: some View {
        VStack {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimensionWidth, height: size.dimensionHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    MoviePoster(movie: Movie.MOCK_MOVIE[0], size: .poster)
}
