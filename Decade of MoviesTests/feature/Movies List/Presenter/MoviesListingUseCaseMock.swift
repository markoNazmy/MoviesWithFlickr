//
//  MoviesListingUseCaseMock.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

struct SuccessMoviesListingUseCaseMock: MoviesListingUseCaseProtocol {
    
    func excute(result: @escaping MoviesListResult) {
        result(.success(response: moviesResponse))
    }
    
}

struct FailureMoviesListingUseCaseMock: MoviesListingUseCaseProtocol {
    
    func excute(result: @escaping MoviesListResult) {
        result(.failure(error: AppError(fromError: nil)))
    }
    
}

struct EmptyMoviesListingUseCaseMock: MoviesListingUseCaseProtocol {
    
    func excute(result: @escaping MoviesListResult) {
        result(.success(response: moviesEmptyResponse))
    }
    
}
