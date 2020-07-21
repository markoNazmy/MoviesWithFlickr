//
//  MovieDetailsPresenter.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

protocol MovieDetailsView: class {
    func refreshCollectionView()
    func setupMovieMainPhoto(url: String)
}

class MovieDetailsPresenter {
    
    enum ViewMode: Int {
        case data
        case empty
        case error
    }
    
    var movieFlickrPhotosUseCase: MovieFlickrPhotosUseCaseProtocol = MovieFlickrPhotosUseCase()
    var movieMainPhotoUseCase: MovieMainPhotoUseCaseProtocol = MovieMainPhotoUseCase()
    weak var view: MovieDetailsView!
    
    var movie: Movie!
    var photos: [String] = []
    var mainPhoto: String?
    var viewMode: ViewMode = .data
        
    init(view: MovieDetailsView) {
        self.view = view
    }
    
    init(view: MovieDetailsView, movieFlickrPhotosUseCase: MovieFlickrPhotosUseCaseProtocol, movieMainPhotoUseCase: MovieMainPhotoUseCaseProtocol) {
        self.view = view
        self.movieFlickrPhotosUseCase = movieFlickrPhotosUseCase
        self.movieMainPhotoUseCase = movieMainPhotoUseCase
    }
    
    func getMoviePhotos() {
        movieFlickrPhotosUseCase.excute(movieTitle: movie?.title ?? "") {[weak self] (result) in
            switch result {
            case .success(let response):
             self?.setupView(response: response)
            case .failure:
                self?.viewMode = .error
                self?.view?.refreshCollectionView()
            }
            self?.view?.refreshCollectionView()
        }
    }
    
    private func setupView(response: [String]) {
        photos.append(contentsOf: response)
        if photos.isEmpty == true {
            viewMode = .empty
        } else {
            viewMode = .data
        }
    }
    
    func getMovieMainPhoto() {
        movieMainPhotoUseCase.excute(movieTitle: movie?.title ?? "") {[weak self] (result) in
            switch result {
            case .success(let response):
                self?.mainPhoto = response
                self?.view?.setupMovieMainPhoto(url: response ?? "")
            default:
                break
            }
        }
    }
    
    func getFullString(array: [String]?) -> String? {
        if var reducedString = array?.reduce("", { return "\($0 ?? ""), \($1)" }) {
            reducedString.removeFirst()
            reducedString.removeFirst()
            return reducedString
        }
        return nil
    }
    
    func pageIfNeeded(indexPath: IndexPath) {
        let threshold = 5
        let columsInRow = 2
        let totalItemsCount = photos.count
        let rowsNumber = totalItemsCount / columsInRow
        let currentRowsNumber = indexPath.row / columsInRow
        let shouldPage = rowsNumber - currentRowsNumber == threshold
        if shouldPage {
            getMoviePhotos()
        }
    }
}
