//
//  HomeView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TrendingMoviesView()
                    OnAirSeriesView()
                }
                .background(Color.black)
            }
            .background(Color.black)
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailsView(movie: movie)
            }
            .navigationDestination(for: Series.self) { series in
                SeriesDetailsView(series: series)
            }
        }
    }
}

#Preview {
    HomeView()
}
