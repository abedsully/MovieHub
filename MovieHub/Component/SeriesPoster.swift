//
//  SeriesPoster.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import SwiftUI

struct SeriesPoster: View {
    let series: Series
    let size: CardSize
    
    var body: some View {
        VStack {
            AsyncImage(url: series.posterURL) { image in
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
    SeriesPoster(series: Series.MOCK_SERIES[0], size: .poster)
}
