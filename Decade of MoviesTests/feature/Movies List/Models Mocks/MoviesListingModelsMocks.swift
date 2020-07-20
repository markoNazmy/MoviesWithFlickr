//
//  MoviesListingModelsMocks.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

var moviesResponse = Movies(movies: [Movie(title: "movie1", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 5),
                                     Movie(title: "movie2", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 4),
                                     Movie(title: "movie3", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 2),
                                     Movie(title: "movie4", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 3),
                                     Movie(title: "movie5", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 1),
                                     Movie(title: "movie6", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 0),
                                     Movie(title: "movie7", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 1),
                                     Movie(title: "movie8", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 2),
                                     Movie(title: "movie9", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 3),
                                     Movie(title: "movie10", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 4),
                                     Movie(title: "movie11", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 5),
                                     Movie(title: "movie12", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 0)])

var moviesEmptyResponse = Movies(movies: nil)

var categorizedMovies: [Int: [Movie]] = [2008: [ Movie(title: "movie1", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 1),
                                                 Movie(title: "movie2", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 2),
                                                 Movie(title: "movie3", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 3),
                                                 Movie(title: "movie4", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 4),
                                                 Movie(title: "movie5", year: 2008, cast: ["name", "name"], genres: ["comedy"], rating: 5)],
                                         2009: [ Movie(title: "movie11", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 1),
                                                 Movie(title: "movie10", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 2),
                                                 Movie(title: "movie9", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 3),
                                                 Movie(title: "movie8", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 4),
                                                 Movie(title: "movie7", year: 2009, cast: ["name", "name"], genres: ["comedy"], rating: 5)]]

var emptyCategorizedMovies: [Int: [Movie]] = [:]
