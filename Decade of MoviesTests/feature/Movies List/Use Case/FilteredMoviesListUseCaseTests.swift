//
//  FilteredMoviesListUseCaseTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Nimble
import Quick
@testable import Decade_of_Movies

class FilteredMoviesListUseCaseTests: QuickSpec {
    
    let sucFilteredMoviesListUseCase: FilteredMoviesListUseCase = FilteredMoviesListUseCase(repository: SuccessMoviesListingRepositoryMock())
    let failFilteredMoviesListUseCase: FilteredMoviesListUseCase = FilteredMoviesListUseCase(repository: FailureMoviesListingRepositoryMock())
    
    override func spec() {
        
        describe("MoviesListingUseCase") {
            describe("its success case") {
                it("must return a values and the values are equal") {
                    self.sucFilteredMoviesListUseCase.excute(key: "mov") { result in
                        switch result {
                        case .success(let response):
                            expect(response).to(beAnInstanceOf([Int: [Movie]].self))
                            for item in response {
                                if let movies = categorizedMovies[item.key] {
                                    expect(item.value[0] == movies[0]).to(beTruthy())
                                    expect(item.value[item.value.count - 1] == movies[movies.count - 1]).to(beTruthy())
                                } else {
                                    fail()
                                }
                            }
                        case .failure(let error):
                            expect(error).to(beAnInstanceOf(Movies.self))
                        }
                    }
                    
                }
            }
            
            describe("its failure case") {
                it("must return an error") {
                    self.failFilteredMoviesListUseCase.excute(key: "movie") { result in
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
