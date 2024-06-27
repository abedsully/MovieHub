//
//  MovieDetailsView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/27/24.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            MovieBackground(movie: movie, size: .background)
        }
    }
}

#Preview {
    MovieDetailsView(movie: Movie(id: 1, title: "test", overview: "asassa", vote_average: 7.0, poster_path: "asa", backdrop_path: "asa"))
}
