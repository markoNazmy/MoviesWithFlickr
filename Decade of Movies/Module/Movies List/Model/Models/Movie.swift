//
//  Movie.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation


// MARK: - Movie
struct Movie: Codable {
    let title: String?
    let year: Int?
    let cast: [String]?
    let genres: [String]?
    let rating: Int?
}
