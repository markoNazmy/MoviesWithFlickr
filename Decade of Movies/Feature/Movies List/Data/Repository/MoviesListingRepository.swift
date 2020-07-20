//
//  MoviesListingRepository.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias MoviesListResult = (Result<Movies, AppError>) -> Void

protocol MoviesListingRepositoryProtocol {
    func fetchMoviesList(result: @escaping MoviesListResult)
}

struct MoviesListingRepository: MoviesListingRepositoryProtocol {
    
    var fetcher: Fetcher = DataStoreFactory.getFetcher(type: .local)
    
    init() {
        
    }
    
    init(fetcher: Fetcher) {
        self.fetcher = fetcher
    }
    
    func fetchMoviesList(result: @escaping MoviesListResult) {
        fetcher.start(request: MoviesListRequest.getLocalMovies) { response in
            result(response)
        }
    }
    
}
