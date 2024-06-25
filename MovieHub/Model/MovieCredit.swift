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
    let profile_path: String
    let order: Int
}
