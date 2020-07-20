//
//  MovieMainPhotoUseCaseTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

@testable import Decade_of_Movies
import Nimble
import Quick

class MovieMainPhotoUseCaseTests: QuickSpec {
    
    let sucMovieMainPhotoUseCase: MovieMainPhotoUseCase = MovieMainPhotoUseCase(repository: SuccessMovieFlickrPhotosRepositoryMock())
    let failMovieMainPhotoUseCase: MovieMainPhotoUseCase = MovieMainPhotoUseCase(repository: FailureMovieFlickrPhotosRepositoryMock())
    
    override func spec() {
        
        describe("MovieMainPhotoUseCase") {
            describe("its success case") {
                it("must return a value") {
                    self.sucMovieMainPhotoUseCase.excute(movieTitle: "") { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf(String.self))
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf(String.self))
                        }
                    }
                }
            }
            
            describe("its failure case") {
                it("must return an error") {
                    self.failMovieMainPhotoUseCase.excute(movieTitle: "") { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf(AppError.self))
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf(AppError.self))
                        }
                    }
                }
            }
        }
    }
    
}
