//
//  MovieMainPhotoUseCase.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias MovieMainPhotoResult = (Result<String?, AppError>) -> (Void)

protocol MovieMainPhotoUseCaseProtocol {
    func excute(movieTitle: String, result: @escaping MovieMainPhotoResult)
}

struct MovieMainPhotoUseCase: MovieMainPhotoUseCaseProtocol {
    
    var repository: MovieFlickrPhotosRepositoryProtocol = MovieFlickrPhotosRepository()
    
    init() {
        
    }
    
    init(repository: MovieFlickrPhotosRepositoryProtocol) {
        self.repository = repository
    }
    
    func excute(movieTitle: String, result: @escaping MovieMainPhotoResult) {
        
        repository.fetchMoviesList(movieTitle: movieTitle, page: 1, photosPerPage: 1) { resp in
            switch resp {
            case .success(let response):
                if let photos = response.photos?.photo, !photos.isEmpty,  let photo = response.photos?.photo?[0] {
                    result(.success(response: "https://farm\(photo.farm ?? 0).static.flickr.com/\(photo.server ?? "")/\(photo.id ?? "")_\(photo.secret ?? "").jpg"))
                } else {
                    result(.success(response: nil))
                }
            case .failure(let error):
                result(.failure(error: error))
            }
        }
    }
    
}
