//
//  SeriesDetailsView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import SwiftUI

struct SeriesDetailsView: View {
    @ObservedObject var viewModel: SeriesDetailsViewModel
    
    var series: Series {
        return viewModel.series
    }
    
    var detail: SeriesDetail {
        return viewModel.seriesDetail ?? SeriesDetail.MOCK_SERIES[0]
    }
    
    init(series: Series) {
        self.viewModel = SeriesDetailsViewModel(series: series)
    }
    
    var body: some View {
        VStack {
            Text(detail.name)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(detail.seasons) {season in
                        SeasonCard(series: series, season: season, size: .poster)
                    }
                }
            }

        }
    }
}

#Preview {
    SeriesDetailsView(series: Series.MOCK_SERIES[0])
}
