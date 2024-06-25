//
//  MovieDetail.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/25/24.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let runtime: Int
    let overview: String
}
