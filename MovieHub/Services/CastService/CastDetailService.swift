//
//  CastDetailService.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import Foundation

class CastDetailService {
    static let shared = CastDetailService()
    
    func loadCastDetail(for actorId: Int) async throws -> CastDetail {
        guard let url = URL(string: URLConstant.loadCastDetail(for: actorId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let castDetail = try JSONDecoder().decode(CastDetail.self, from: data)
            return castDetail
        } catch {
            print("Failed to decode cast detail: \(error.localizedDescription)")
            throw error
        }
    }
    
    func loadCastCredit(for actorId: Int) async throws -> CastCredit {
        guard let url = URL(string: URLConstant.loadCastCredit(for: actorId)) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let castCredits = try JSONDecoder().decode(CastCredit.self, from: data)
            return castCredits
        } catch {
            print("Failed to decode cast credits: \(error.localizedDescription)")
            throw error
        }
    }
}
