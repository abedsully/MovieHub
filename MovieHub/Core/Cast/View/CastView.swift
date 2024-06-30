//
//  CastView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import SwiftUI

struct CastView: View {
    @ObservedObject var viewModel: CastViewModel
    
    var movie: Movie {
        return viewModel.movie
    }
    
    init(movie: Movie) {
        self.viewModel = CastViewModel(movie: movie)
    }
    
    var body: some View {
        HStack {
            ScrollView(.horizontal){
                HStack {
                    ForEach(viewModel.movieCast) { cast in
                        NavigationLink(value: cast) {
                            CastCard(cast: cast)
                        }
                    }
                }
                .navigationDestination(for: Cast.self) { cast in
                    CastDetailView(cast: cast)
                }
            }
        }
    }
}

#Preview {
    CastView(movie: Movie.MOCK_MOVIE[0])
}
