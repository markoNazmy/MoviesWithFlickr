//
//  MovieFlickrPhotosUseCase.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

class MovieFlickrPhotosUseCase {
    var currentPage: Int = 1
    var pageSize: Int = 20
    var totalPagesCount: Int?
    
    func excute(movieTitle: String, result: @escaping MovieFlickrPhotosResult) {
        
        if let totalPagesCount = totalPagesCount, (totalPagesCount == 0 || totalPagesCount > currentPage) {
            return
        }
        
        MovieFlickrPhotosRepository.fetchMoviesList(movieTitle: movieTitle, page: currentPage, photosPerPage: pageSize) { [weak self] resp in
            switch resp {
            case .success(let response):
                self?.currentPage += 1
                result(.success(response: response))
            case .failure(let error):
                result(.failure(error: error))
            }
        }
    }
    
}
