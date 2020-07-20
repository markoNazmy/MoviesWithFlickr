//
//  MoviesListingRepositoryMock.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

struct SuccessMoviesListingRepositoryMock: MoviesListingRepositoryProtocol {
    
    func fetchMoviesList(result: @escaping MoviesListResult) {
        result(.success(response: moviesResponse))
    }
    
}

struct FailureMoviesListingRepositoryMock: MoviesListingRepositoryProtocol {
    
    func fetchMoviesList(result: @escaping MoviesListResult) {
        result(.failure(error: AppError(fromError: nil)))
    }
    
}
