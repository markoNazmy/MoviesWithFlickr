//
//  MovieMainPhotoUseCaseMock.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

struct SuccessMovieMainPhotoUseCaseMock: MovieMainPhotoUseCaseProtocol {
    
    func excute(movieTitle: String, result: @escaping MovieMainPhotoResult) {
        result(.success(response: ""))
    }
    
}

struct FailureMovieMainPhotoUseCaseMock: MovieMainPhotoUseCaseProtocol {
    
    func excute(movieTitle: String, result: @escaping MovieMainPhotoResult) {
        result(.failure(error: AppError(fromError: nil)))
    }
 
}

struct EmptyMovieMainPhotoUseCaseMock: MovieMainPhotoUseCaseProtocol {
 
    func excute(movieTitle: String, result: @escaping MovieMainPhotoResult) {
        result(.success(response: nil))
    }
    
}
