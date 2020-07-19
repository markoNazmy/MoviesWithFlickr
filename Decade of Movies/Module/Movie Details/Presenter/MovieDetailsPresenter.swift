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
    
    let movieFlickrPhotosUseCase = MovieFlickrPhotosUseCase()
    let movieMainPhotoUseCase = MovieMainPhotoUseCase()
    weak var view: MovieDetailsView!
    
    var movie: Movie!
    var photos: [Photo] = []
        
    init(view: MovieDetailsView) {
        self.view = view
    }
    
    func getMoviePhotos() {
        movieFlickrPhotosUseCase.excute(movieTitle: movie.title ?? "") {[weak self] (result) in
            switch result {
            case .success(let response):
                self?.photos.append(contentsOf: response.photos?.photo ?? [])
                self?.view.refreshCollectionView()
            case .failure(let error):
                break
            }
        }
    }
    
    func getMovieMainPhoto() {
        movieMainPhotoUseCase.excute(movieTitle: movie.title ?? "") {[weak self] (result) in
            switch result {
            case .success(let response):
                self?.view.setupMovieMainPhoto(url: response ?? "")
            case .failure(let error):
                break
            }
        }
    }
    
    func getFullString(array: [String]?) -> String? {
        if var reducedString = array?.reduce("", { return "\($0 ?? ""), \($1)"}) {
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
