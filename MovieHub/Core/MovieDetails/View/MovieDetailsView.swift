//
//  MovieDetailsView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/27/24.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    
    var movie: Movie {
        return viewModel.movie
    }
    
    var detail: MovieDetail {
        return viewModel.movieDetail ?? MovieDetail.MOCK_DETAIL[0]
    }
    
    
    init(movie: Movie) {
        self.viewModel = MovieDetailsViewModel(movie: movie)
    }
    
    var body: some View {
        VStack {
            MovieBackground(movie: movie, size: .background)
            
            Text(detail.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.movieCast) { cast in
                        VStack {
                            MovieCastDetail(cast: cast)
                        }    
                    }
                }
            }
        }
    }
}

#Preview {
    MovieDetailsView(movie: Movie(id: 1, title: "test", overview: "asassa", vote_average: 7.0, poster_path: "asa", backdrop_path: "asa"))
}
