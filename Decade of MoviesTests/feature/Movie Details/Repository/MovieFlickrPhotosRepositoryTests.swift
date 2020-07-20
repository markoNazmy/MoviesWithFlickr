//
//  MovieFlickrPhotosRepositoryTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Nimble
import Quick
@testable import Decade_of_Movies

class MovieFlickrPhotosRepositoryTests: QuickSpec {
    
    let sucMovieFlickrPhotosRepository: MovieFlickrPhotosRepository = MovieFlickrPhotosRepository(fetcher: MovieFlickrSuccessFetcherMock())
    let failMovieFlickrPhotosRepository: MovieFlickrPhotosRepository = MovieFlickrPhotosRepository(fetcher: MovieFlickrFailureFetcherMock())
    
    override func spec() {
        
        describe("MovieFlickrPhotosRepository") {
            describe("its success case") {
                it("must return a value") {
                    self.sucMovieFlickrPhotosRepository.fetchMoviesList(movieTitle: "", page: 1, photosPerPage: 1) { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf(PhotosResponse.self))
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf(PhotosResponse.self))
                        }
                    }
                    
                }
            }
            
            describe("its failure case") {
                it("must return an error") {
                    self.failMovieFlickrPhotosRepository.fetchMoviesList(movieTitle: "", page: 1, photosPerPage: 1) { result  in
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
