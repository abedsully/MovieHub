//
//  MovieCredit.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct MovieCredit: Identifiable, Decodable {
    let id: Int
    let cast: [MovieCast]
}

struct MovieCast: Identifiable, Decodable {
    let id: Int
    let name: String
    let character: String
    let profile_path: String?
    let order: Int
    
    var profileURL: URL {
        if let baseURL = URL(string: URLConstant.imageURL) {
            return baseURL.appending(path: profile_path ?? "")
        } else {
            return URL(string: "https://example.com/placeholder.jpg")!
        }
    }
}

extension MovieCast {
    static var MOCK_CAST: [MovieCast] = [
        .init(id: 1, name: "Robert Downey Jr", character: "Iron Man", profile_path: "test", order: 1)
    ]
}



