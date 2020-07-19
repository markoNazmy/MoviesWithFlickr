//
//  MovieFlickrPhotosRepository.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias MovieFlickrPhotosResult = (Result<PhotosResponse, AppError>) -> (Void)

struct MovieFlickrPhotosRepository {
    
    static func fetchMoviesList(movieTitle: String, page: Int, photosPerPage: Int, result: @escaping MovieFlickrPhotosResult) {
        DataStoreFactory.getFetcher(type: .network).start(request: MovieFlickrPhotosRequest.movieFlickrPhotosRequest(movieTitle: movieTitle, page: page, photosPerPage: photosPerPage)) { response in
            result(response)
        }
    }

}
