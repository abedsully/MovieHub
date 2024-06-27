//
//  MovieBackground.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/27/24.
//

import SwiftUI

struct MovieBackground: View {
    let movie: Movie
    let size: MovieCardSize
    
    var body: some View {
        VStack {
            AsyncImage(url: movie.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.dimensionWidth, height: size.dimensionHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    MovieBackground(movie: Movie.MOCK_MOVIE[0], size: .background)
}
