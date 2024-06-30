//
//  GlobalFormatter.swift
//  MovieHub
//
//  Created by Stefanus Albert Wilson on 6/29/24.
//

import Foundation

struct GlobalFormatter {
    
    func formatRuntime(runTime: Int) -> String {
        let hours = runTime / 60
        let minutes = runTime % 60
        
        return "\(hours)h \(minutes)m"
    }
    
    func releaseYear(release_date: String) -> String {
        let components = release_date.split(separator: "-")
        return components.first.map(String.init) ?? "Unknown"
    }
}
