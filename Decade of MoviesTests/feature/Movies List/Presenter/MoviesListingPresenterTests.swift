//
//  MoviesListingPresenterTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Nimble
import Quick
@testable import Decade_of_Movies

class MoviesListingPresenterTests: QuickSpec {
    
    let sucMoviesListingPresenter: MoviesListingPresenter = MoviesListingPresenter(view: MoviesListingViewMock(), moviesListingUseCase: SuccessMoviesListingUseCaseMock(), filteredMoviesListUseCase: SuccessFilteredMoviesListUseCaseMock())
    let failMoviesListingPresenter: MoviesListingPresenter = MoviesListingPresenter(view: MoviesListingViewMock(), moviesListingUseCase: FailureMoviesListingUseCaseMock(), filteredMoviesListUseCase: FailureFilteredMoviesListUseCaseMock())
    let emptyMoviesListingPresenter: MoviesListingPresenter = MoviesListingPresenter(view: MoviesListingViewMock(), moviesListingUseCase: EmptyMoviesListingUseCaseMock(), filteredMoviesListUseCase: EmptyFilteredMoviesListUseCaseMock())
    
    override func spec() {
        
        describe("MoviesListingPresenter") {
            describe("its success case") {
                it("must return a single row view mode value") {
                    self.sucMoviesListingPresenter.getAllMovies()
                    expect(self.sucMoviesListingPresenter.viewMode).to(equal(MoviesListingPresenter.ViewMode.singleRow))
                    expect(!self.sucMoviesListingPresenter.movies.isEmpty).to(beTruthy())
                }
                
                it("must return a section view mode value") {
                    self.sucMoviesListingPresenter.getAllMovies(withKey: "mov")
                    expect(self.sucMoviesListingPresenter.viewMode).to(equal(MoviesListingPresenter.ViewMode.sections))
                    expect(!self.sucMoviesListingPresenter.categorizedMovies.isEmpty).to(beTruthy())
                }
            }
            
            describe("its failure case") {
                it("must return an error viewMode") {
                    
                    self.failMoviesListingPresenter.getAllMovies()
                    expect(self.failMoviesListingPresenter.viewMode).to(equal(MoviesListingPresenter.ViewMode.error))
                    
                    self.failMoviesListingPresenter.viewMode = .empty
                    self.failMoviesListingPresenter.getAllMovies(withKey: "mov")
                    expect(self.failMoviesListingPresenter.viewMode).to(equal(MoviesListingPresenter.ViewMode.error))
                }
            }
            
            describe("its empty case") {
                it("must return an empty viewMode Value") {
                    
                    self.emptyMoviesListingPresenter.getAllMovies()
                    expect(self.emptyMoviesListingPresenter.viewMode).to(equal(MoviesListingPresenter.ViewMode.empty))
                    expect(self.emptyMoviesListingPresenter.movies.isEmpty).to(beTruthy())
                    
                    self.emptyMoviesListingPresenter.viewMode = .singleRow
                    self.emptyMoviesListingPresenter.getAllMovies(withKey: "mov")
                    expect(self.emptyMoviesListingPresenter.viewMode).to(equal(MoviesListingPresenter.ViewMode.empty))
                    expect(self.emptyMoviesListingPresenter.categorizedMovies.isEmpty).to(beTruthy())
                }
            }
        }
    }
    
}
