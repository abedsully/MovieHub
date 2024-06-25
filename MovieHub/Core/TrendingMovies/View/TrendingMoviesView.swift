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
        VStack {
            ForEach(viewModel.trendingMovies) { movie in
                Text(movie.title)
            }
        }
        .task {
            do {
                try await viewModel.fetchTrendingMovies()
            } catch {
                print("Error loading trending movies: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    TrendingMoviesView()
}
