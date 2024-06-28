//
//  TrendingMoviesView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import SwiftUI

struct TrendingMoviesView: View {
    @StateObject var viewModel = TrendingMoviesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Trending Now")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.trendingMovies) { movie in
                                NavigationLink(value: movie) {
                                    MoviePoster(movie: movie, size: .poster)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color(.black))
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailsView(movie: movie)
            }
        }
    }
}

#Preview {
    TrendingMoviesView()
}
