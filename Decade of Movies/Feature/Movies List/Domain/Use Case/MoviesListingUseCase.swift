//
//  MoviesListingUseCase.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

struct MoviesListingUseCase {
    
    func excute(result: @escaping MoviesListResult) {
        MoviesListingRepository.fetchMoviesList(result: result)
    }
    
}
