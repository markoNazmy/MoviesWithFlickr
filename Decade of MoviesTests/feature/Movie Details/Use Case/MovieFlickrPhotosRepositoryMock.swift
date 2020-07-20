//
//  MovieFlickrPhotosRepositoryMock.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

struct SuccessMovieFlickrPhotosRepositoryMock: MovieFlickrPhotosRepositoryProtocol {
    
    func fetchMoviesList(movieTitle: String, page: Int, photosPerPage: Int, result: @escaping MovieFlickrPhotosResult) {
        if page == 1 {
            result(.success(response: photosResponse1))
        } else {
            result(.success(response: photosResponse2))
        }
    }
    
}

struct FailureMovieFlickrPhotosRepositoryMock: MovieFlickrPhotosRepositoryProtocol {
    
    func fetchMoviesList(movieTitle: String, page: Int, photosPerPage: Int, result: @escaping MovieFlickrPhotosResult) {
        result(.failure(error: AppError(fromError: nil)))
    }
    
}
