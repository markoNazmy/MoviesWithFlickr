//
//  MoviesListingRepositoryTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Nimble
import Quick
@testable import Decade_of_Movies

class MoviesListingRepositoryTests: QuickSpec {

    let sucMoviesListingRepository: MoviesListingRepository = MoviesListingRepository(fetcher: MoviesListingSuccessFetcherMock())
    let failMoviesListingRepository: MoviesListingRepository = MoviesListingRepository(fetcher: MoviesListingFailureFetcherMock())

    override func spec() {
        
        describe("MoviesListingRepository") {
            describe("its success case") {
                it("must return a value") {
                    self.sucMoviesListingRepository.fetchMoviesList { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf(Movies.self))
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf(Movies.self))
                        }
                    }
                    
                }
            }
            
            describe("its failure case") {
                it("must return an error") {
                    self.failMoviesListingRepository.fetchMoviesList { result  in
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
