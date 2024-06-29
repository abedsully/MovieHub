//
//  TrendingSeriesService.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import Foundation

class TrendingSeriesService {
    
    static let shared = TrendingSeriesService()
    
    // MARK: - Fetching On Air Series
    func loadOnAirSeries() async throws -> TrendingSeries {
        guard let url = URL(string: URLConstant.onAirSeries) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let trendingResult = try JSONDecoder().decode(TrendingSeries.self, from: data)
            return trendingResult
        } catch {
            print("Failed to decode trending series: \(error.localizedDescription)")
            throw error
        }
    }
}
