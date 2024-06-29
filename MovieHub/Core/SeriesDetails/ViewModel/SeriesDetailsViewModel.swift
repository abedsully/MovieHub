//
//  SeriesDetailsViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import Foundation

@MainActor
class SeriesDetailsViewModel: ObservableObject {
    @Published var seriesDetail: SeriesDetail?
    @Published var seriesCast =  [Cast]()
    @Published var series: Series
    
    init(series: Series) {
        self.series = series
        
        Task {
            try await loadSeriesDetails()
        }
        
        Task {
            try await loadSeriesCredits()
        }
    }
    
    @MainActor
    func loadSeriesDetails() async throws {
        do {
            self.seriesDetail = try await SeriesDetailsService.shared.loadSeriesDetails(seriesId: series.id)
        } catch {
            print("Failed to load series details: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadSeriesCredits() async throws {
        do {
            let seriesCredit = try await SeriesDetailsService.shared.loadSeriesCredits(seriesId: series.id)
            let filteredCast = seriesCredit.cast.filter {$0.order <= 10}
            self.seriesCast = filteredCast
        } catch {
            print("Failed to load series casts: \(error.localizedDescription)")
        }
    }
}
