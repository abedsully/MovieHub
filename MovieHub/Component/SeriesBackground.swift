//
//  SeriesBackground.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import SwiftUI

struct SeriesBackground: View {
    let series: Series
    let size: CardSize
    
    var body: some View {
        VStack {
            AsyncImage(url: series.backdropURL) { image in
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
    SeriesBackground(series: Series.MOCK_SERIES[0], size: .background)
}
