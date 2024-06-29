//
//  OnAirSeriesView.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import SwiftUI

struct OnAirSeriesView: View {
    @StateObject var viewModel = OnAirSeriesViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("On Air Series")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.onAirSeries) { series in
                            NavigationLink(value: series) {
                                SeriesPoster(series: series, size: .poster)
                            }
                        }
                    }
                }
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.black)
    }
}

#Preview {
    OnAirSeriesView()
}
 
