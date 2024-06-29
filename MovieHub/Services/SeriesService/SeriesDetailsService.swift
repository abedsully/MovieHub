//
//  SeriesDetailsService.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import Foundation

class SeriesDetailsService {
    static let shared = SeriesDetailsService()
    
    // MARK: - Fetching Series Details
    func loadSeriesDetails(seriesId: Int) async throws -> SeriesDetail {
        guard let url = URL(string: URLConstant.seriesDetailURL(for: seriesId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let seriesDetails = try JSONDecoder().decode(SeriesDetail.self, from: data)
            return seriesDetails
        } catch {
            print("Failed to decode series details: \(error.localizedDescription)")
            throw error
        }
    }
    
    // MARK: - Fetching Series Credits
    func loadSeriesCredits(seriesId: Int) async throws -> Credit {
        guard let url = URL(string: URLConstant.seriesCreditURL(for: seriesId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let seriesCredits = try JSONDecoder().decode(Credit.self, from: data)
            return seriesCredits
        } catch {
            print("Failed to decode series credits: \(error.localizedDescription)")
            throw error
        }
    }
    
}
