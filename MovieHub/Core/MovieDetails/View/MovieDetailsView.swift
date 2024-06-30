//
//  MovieDetailsView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/27/24.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    @Environment(\.dismiss) var dismiss
    
    let formatter = GlobalFormatter()
    
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
        ScrollView {
            ZStack(alignment: .top) {
                MovieBackground(movie: movie, size: .background)
                    .background(Color(.blue))
                    .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    HStack (alignment: .top) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                    }
                    .frame(height: 300, alignment: .top)
                    .padding(.top, 36)
                    
                    HStack (alignment: .center, spacing: 10) {
                        Text(detail.title)
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        HStack (alignment: .center) {
                            Image(systemName: "hand.thumbsup.fill")
                                .imageScale(.medium)
                            
                            Text(String(format: "%.1f", detail.vote_average))
                                .font(.subheadline)
                        }
                        
                    }
                    .padding(.vertical, 8)
                    
                    HStack (alignment: .center, spacing: 10) {
                        Text(formatter.releaseYear(release_date: detail.release_date))
                        Text("•")
                            .font(.headline)
                        Text(formatter.formatRuntime(runTime: detail.runtime))
                    }
                    .font(.subheadline)
                    
                    Text("Directed by: \(viewModel.movieDirector)")
                        .font(.subheadline)
                        .padding(.vertical, 8)
                    
                    
                    Text(detail.overview)
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray2))
                        .frame(maxHeight: .infinity)
                    
                    Text("Top Casts")
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.top, 16)
                    
                    CastView(movie: movie)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.movieCast) { cast in
                                NavigationLink(value: cast) {
                                    VStack {
                                        CastCard(cast: cast)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding(.bottom, 16)
                    
                    Text("Recommended Movies")
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.top, 16)
                    
                    MovieRecommendationView(movie: movie)
                    
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
            }
        }
        .scrollIndicators(.never)
        .ignoresSafeArea(edges: .top)
        .background(Color(.black))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MovieDetailsView(movie: Movie(id: 1, title: "test", overview: "asassa", vote_average: 7.0, poster_path: "asa", backdrop_path: "asa"))
}
