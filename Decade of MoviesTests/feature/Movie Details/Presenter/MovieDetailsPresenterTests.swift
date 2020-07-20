//
//  MovieDetailsPresenterTests.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Nimble
import Quick
@testable import Decade_of_Movies

class MovieDetailsPresenterTests: QuickSpec {
    
    let sucMovieDetailsPresenter: MovieDetailsPresenter = MovieDetailsPresenter(view: MovieDetailsViewMock(), movieFlickrPhotosUseCase: SuccessMovieFlickrPhotosUseCaseMock(), movieMainPhotoUseCase: SuccessMovieMainPhotoUseCaseMock())
    let failMovieDetailsPresenter: MovieDetailsPresenter = MovieDetailsPresenter(view: MovieDetailsViewMock(), movieFlickrPhotosUseCase: FailureMovieFlickrPhotosUseCaseMock(), movieMainPhotoUseCase: FailureMovieMainPhotoUseCaseMock())
    let emptyMovieDetailsPresenter: MovieDetailsPresenter = MovieDetailsPresenter(view: MovieDetailsViewMock(), movieFlickrPhotosUseCase: EmptyMovieFlickrPhotosUseCaseMock(), movieMainPhotoUseCase: EmptyMovieMainPhotoUseCaseMock())
    
    override func spec() {
        
        describe("MovieDetailsPresenter") {
            describe("its success case") {
                it("must return a data view mode value") {
                    self.sucMovieDetailsPresenter.getMoviePhotos()
                    expect(self.sucMovieDetailsPresenter.viewMode).to(equal(MovieDetailsPresenter.ViewMode.data))
                    expect(!self.sucMovieDetailsPresenter.photos.isEmpty).to(beTruthy())
                }
                
                it("main photo must has a value") {
                    self.sucMovieDetailsPresenter.getMovieMainPhoto()
                    expect(self.sucMovieDetailsPresenter.mainPhoto).to(be(""))
                }
            }
            
            describe("its failure case") {
                it("must return an error viewMode") {
                    self.failMovieDetailsPresenter.getMoviePhotos()
                    expect(self.failMovieDetailsPresenter.viewMode).to(equal(MovieDetailsPresenter.ViewMode.error))
                }
            }
            
            describe("its empty case") {
                it("must return an empty viewMode Value") {
                    
                    self.emptyMovieDetailsPresenter.getMoviePhotos()
                    expect(self.emptyMovieDetailsPresenter.viewMode).to(equal(MovieDetailsPresenter.ViewMode.empty))
                    expect(self.emptyMovieDetailsPresenter.photos.isEmpty).to(beTruthy())
                }
                
                it("main photo must be nil") {
                    self.emptyMovieDetailsPresenter.getMovieMainPhoto()
                    expect(self.emptyMovieDetailsPresenter.mainPhoto).to(beNil())
                }
            }
            
            describe("its cast and genres creation") {
                it("must return a vaild value") {
                    
                    expect(self.sucMovieDetailsPresenter.getFullString(array: movieResponse.genres)).to(equal("comedy, drama"))
                    expect(self.sucMovieDetailsPresenter.getFullString(array: movieResponse.cast)).to(equal("name1, name2"))
                }
                
                it("must return a nil value with nil cast and nil genres") {
                    
                    expect(self.sucMovieDetailsPresenter.getFullString(array: nil)).to(beNil())
                    expect(self.sucMovieDetailsPresenter.getFullString(array: nil)).to(beNil())
                }
            }
        }
    }
    
}
