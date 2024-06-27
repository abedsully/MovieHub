//
//  MovieCardSize.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/27/24.
//

import Foundation

enum MovieCardSize {
    case poster
    case background
    
    var dimensionWidth: CGFloat{
        switch self {
        case .poster:
            return 150
        case .background:
            return 400
        }
    }
    
    var dimensionHeight: CGFloat {
        switch self {
        case .poster:
            return 200
        case .background:
            return 300
        }
    }
}
