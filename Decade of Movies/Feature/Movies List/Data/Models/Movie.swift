//
//  Movie.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

struct Movie: Codable, Equatable {
    let title: String?
    let year: Int?
    let cast: [String]?
    let genres: [String]?
    let rating: Int?
    
    public static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title
    }
}
