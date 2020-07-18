//
//  MoviesListingRepository.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias MoviesListResult = (Result<Movies, AppError>) -> (Void)

struct MoviesListingRepository {
    
    static func fetchMoviesList(result: @escaping MoviesListResult) {
        LocalJsonFetcher.shared.start(request: MoviesListRequest.getLocalMovies) { response in
            result(response)
        }
    }
    
}
