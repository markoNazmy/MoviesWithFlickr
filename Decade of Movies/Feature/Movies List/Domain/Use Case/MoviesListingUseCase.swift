//
//  MoviesListingUseCase.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

protocol MoviesListingUseCaseProtocol {
    func excute(result: @escaping MoviesListResult)
}

struct MoviesListingUseCase: MoviesListingUseCaseProtocol {
    
    var repository: MoviesListingRepositoryProtocol = MoviesListingRepository()
    
    init() {
        
    }
    
    init(repository: MoviesListingRepositoryProtocol) {
        self.repository = repository
    }
    
    func excute(result: @escaping MoviesListResult) {
        repository.fetchMoviesList(result: result)
    }
    
}
