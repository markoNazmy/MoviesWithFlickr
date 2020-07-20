//
//  MovieFlickrPhotosUseCaseMock.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

struct SuccessMovieFlickrPhotosUseCaseMock: MovieFlickrPhotosUseCaseProtocol {
    
    func excute(movieTitle: String, result: @escaping MovieFlickrPhotosURLsResult) {
        result(.success(response: photosURLS))
    }
    
}

struct FailureMovieFlickrPhotosUseCaseMock: MovieFlickrPhotosUseCaseProtocol {
    
    func excute(movieTitle: String, result: @escaping MovieFlickrPhotosURLsResult) {
        result(.failure(error: AppError(fromError: nil)))
    }
    
}

struct EmptyMovieFlickrPhotosUseCaseMock: MovieFlickrPhotosUseCaseProtocol {
    
    func excute(movieTitle: String, result: @escaping MovieFlickrPhotosURLsResult) {
        result(.success(response: []))
    }
    
}
