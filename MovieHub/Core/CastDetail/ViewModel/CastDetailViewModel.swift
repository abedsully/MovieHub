//
//  CastDetailViewModel.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/30/24.
//

import Foundation

@MainActor
class CastDetailViewModel: ObservableObject {
    @Published var cast: Cast
    
    @Published var castDetail: CastDetail?
    @Published var castCredit = [Movie]()
    
    init(cast: Cast) {
        self.cast = cast
        
        Task {
            try await loadCastDetail()
        }
        
        Task {
            try await loadCastCredits()
        }
    }
    
    @MainActor
    func loadCastDetail() async throws {
        do {
            self.castDetail = try await CastDetailService.shared.loadCastDetail(for: cast.id)
        } catch {
            print("Failed to load cast detail: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadCastCredits() async throws {
        do {
            let castCredit = try await CastDetailService.shared.loadCastCredit(for: cast.id)
            self.castCredit = castCredit.cast
        } catch {
            print("Failed to load cast credits: \(error.localizedDescription)")
        }
    }
}
