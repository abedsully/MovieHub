//
//  OnAirSeriesViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import Foundation

@MainActor
class OnAirSeriesViewModel: ObservableObject {
    
    @Published var onAirSeries = [Series]()
    
    init() {
        Task {
            try await loadOnAirSeries()
        }
    }
    
    @MainActor
    func loadOnAirSeries() async throws {
        do {
            let trendingSeries = try await TrendingSeriesService.shared.loadOnAirSeries()
            self.onAirSeries = trendingSeries.results
        } catch {
            print("Failed to load on air series: \(error.localizedDescription)")
        }
    }
}
