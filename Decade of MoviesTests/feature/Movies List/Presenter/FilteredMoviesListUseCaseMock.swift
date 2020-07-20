//
//  FilteredMoviesListUseCaseMock.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

struct SuccessFilteredMoviesListUseCaseMock: FilteredMoviesListUseCaseProtocol {
    
    func excute(key: String, result: @escaping FilteredMoviesListResult) {
        result(.success(response: categorizedMovies))
    }
    
}

struct FailureFilteredMoviesListUseCaseMock: FilteredMoviesListUseCaseProtocol {
    
    func excute(key: String, result: @escaping FilteredMoviesListResult) {
        result(.failure(error: AppError(fromError: nil)))
    }

}

struct EmptyFilteredMoviesListUseCaseMock: FilteredMoviesListUseCaseProtocol {
    
    func excute(key: String, result: @escaping FilteredMoviesListResult) {
        result(.success(response: emptyCategorizedMovies))
    }

}
