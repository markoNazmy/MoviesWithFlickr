//
//  MovieFlickrPhotosRepository.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias MovieFlickrPhotosResult = (Result<PhotosResponse, AppError>) -> Void

protocol MovieFlickrPhotosRepositoryProtocol {
    func fetchMoviesList(movieTitle: String, page: Int, photosPerPage: Int, result: @escaping MovieFlickrPhotosResult)
}

struct MovieFlickrPhotosRepository: MovieFlickrPhotosRepositoryProtocol {
    
    var fetcher: Fetcher = DataStoreFactory.getFetcher(type: .network)
    
    init() {
        
    }
    
    init(fetcher: Fetcher) {
        self.fetcher = fetcher
    }
    
    func fetchMoviesList(movieTitle: String, page: Int, photosPerPage: Int, result: @escaping MovieFlickrPhotosResult) {
        fetcher.start(request: MovieFlickrPhotosRequest.movieFlickrPhotosRequest(movieTitle: movieTitle, page: page, photosPerPage: photosPerPage)) { response in
            result(response)
        }
    }

}
