//
//  MovieFlickrPhotosUseCase.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias MovieFlickrPhotosURLsResult = (Result<[String], AppError>) -> (Void)

protocol MovieFlickrPhotosUseCaseProtocol {
    func excute(movieTitle: String, result: @escaping MovieFlickrPhotosURLsResult)
}

class MovieFlickrPhotosUseCase: MovieFlickrPhotosUseCaseProtocol {
    var currentPage: Int = 1
    var pageSize: Int = 20
    var totalPagesCount: Int?
        
    var repository: MovieFlickrPhotosRepositoryProtocol = MovieFlickrPhotosRepository()

    init() {
        
    }
    
    init(repository: MovieFlickrPhotosRepositoryProtocol) {
        self.repository = repository
    }
    
    func excute(movieTitle: String, result: @escaping MovieFlickrPhotosURLsResult) {
        
        if let totalPagesCount = totalPagesCount, (totalPagesCount == 0 || totalPagesCount > currentPage) {
            return
        }
        
        getPhotosList(movieTitle, result)
    }
    
    fileprivate func getPhotosList(_ movieTitle: String, _ result: @escaping MovieFlickrPhotosURLsResult) {
        
        repository.fetchMoviesList(movieTitle: movieTitle, page: currentPage, photosPerPage: pageSize) { [weak self] resp in
            switch resp {
            case .success(let response):
                self?.currentPage += 1
                let photos = response.photos?.photo?.map{ return "https://farm\($0.farm ?? 0).static.flickr.com/\($0.server ?? "")/\($0.id ?? "")_\($0.secret ?? "").jpg" } ?? []
                result(.success(response: photos))
            case .failure(let error):
                result(.failure(error: error))
            }
        }
    }
    
}
