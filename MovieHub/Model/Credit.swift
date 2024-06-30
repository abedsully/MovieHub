//
//  MovieCredit.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct Credit: Identifiable, Decodable {
    let id: Int
    let cast: [Cast]
    let crew: [Crew]
}

struct Cast: Identifiable, Decodable, Hashable {
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

struct Crew: Identifiable, Decodable {
    let id: Int
    let name: String
    let job: String
}

extension Cast {
    static var MOCK_CAST: [Cast] = [
        .init(id: 1, name: "Robert Downey Jr", character: "Iron Man", profile_path: "test", order: 1)
    ]
}



