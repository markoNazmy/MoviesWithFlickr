//
//  MoviesListingUseCaseTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Nimble
import Quick
@testable import Decade_of_Movies

class MoviesListingUseCaseTests: QuickSpec {
    
    let sucMoviesListingUseCase: MoviesListingUseCase = MoviesListingUseCase(repository: SuccessMoviesListingRepositoryMock())
    let failMoviesListingUseCase: MoviesListingUseCase = MoviesListingUseCase(repository: FailureMoviesListingRepositoryMock())
    
    override func spec() {
        
        describe("MoviesListingUseCase") {
            describe("its success case") {
                it("must return a value") {
                    self.sucMoviesListingUseCase.excute { result in
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
                    self.failMoviesListingUseCase.excute { result in
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
