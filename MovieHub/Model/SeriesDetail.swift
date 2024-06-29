//
//  SeriesDetail.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import Foundation

struct SeriesDetail: Identifiable, Decodable {
    let id: Int
    let name: String
    let overview: String
    let seasons: [SeriesSeasons]
    
}

struct SeriesSeasons: Identifiable, Decodable {
    let id: Int
    let name: String
    let episode_count: Int
    let air_date: String?
    let poster_path: String?
    
    var posterURL: URL {
        if let baseURL = URL(string: URLConstant.imageURL) {
            return baseURL.appending(path: poster_path ?? "")
        } else {
            return URL(string: "https://example.com/placeholder.jpg")!
        }
    }
}


extension SeriesDetail {
    static var MOCK_SERIES: [SeriesDetail] = [
        .init(id: 1, name: "Stranger Things", overview: "Great Series", seasons: [SeriesDetail.MOCK_SEASON[0]])
    ]
    
    static var MOCK_SEASON: [SeriesSeasons] = [
        .init(id: 1, name: "Season 1", episode_count: 12, air_date: "12-09-2018", poster_path: "test")
    ]
}

