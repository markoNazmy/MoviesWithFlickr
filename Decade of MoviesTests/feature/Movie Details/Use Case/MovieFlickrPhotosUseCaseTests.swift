//
//  MovieFlickrPhotosUseCaseTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

@testable import Decade_of_Movies
import Nimble
import Quick

class MovieFlickrPhotosUseCaseTests: QuickSpec {
    
    let sucMovieFlickrPhotosUseCase: MovieFlickrPhotosUseCase = MovieFlickrPhotosUseCase(repository: SuccessMovieFlickrPhotosRepositoryMock())
    let failMovieFlickrPhotosUseCase: MovieFlickrPhotosUseCase = MovieFlickrPhotosUseCase(repository: FailureMovieFlickrPhotosRepositoryMock())
    
    override func spec() {
        
        describe("MovieMainPhotoUseCase") {
            describe("its success case") {
                it("must return a value with page 1") {
                    expect(self.sucMovieFlickrPhotosUseCase.currentPage).to(be(1))
                    self.sucMovieFlickrPhotosUseCase.excute(movieTitle: "") { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf([String].self))
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf([String].self))
                        }
                    }
                    expect(self.sucMovieFlickrPhotosUseCase.currentPage).to(be(2))
                }
                
                it("must return a value with page 2") {
                    expect(self.sucMovieFlickrPhotosUseCase.currentPage).to(be(2))
                    self.sucMovieFlickrPhotosUseCase.excute(movieTitle: "") { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf([String].self))
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf([String].self))
                        }
                    }
                    expect(self.sucMovieFlickrPhotosUseCase.currentPage).to(be(3))
                }
            }
            
            describe("its failure case") {
                it("must return an error without changing the page value") {
                    expect(self.failMovieFlickrPhotosUseCase.currentPage).to(be(1))
                    self.failMovieFlickrPhotosUseCase.excute(movieTitle: "") { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf(AppError.self))
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf(AppError.self))
                        }
                    }
                    expect(self.failMovieFlickrPhotosUseCase.currentPage).to(be(1))
                }
            }
        }
    }
    
}
