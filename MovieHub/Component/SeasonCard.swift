//
//  SeasonCard.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import SwiftUI

struct SeasonCard: View {
    let series: Series?
    let season: SeriesSeasons
    let size: CardSize
    
    var body: some View {
        VStack {
            if let posterPath = season.poster_path, !posterPath.isEmpty {
                AsyncImage(url: season.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.dimensionWidth, height: size.dimensionHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
            } else {
                AsyncImage(url: series?.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.dimensionWidth, height: size.dimensionHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text(season.name)
            
        }
    }
}

#Preview {
    SeasonCard(series: Series.MOCK_SERIES[0], season: SeriesDetail.MOCK_SEASON[0], size: .poster)
}
