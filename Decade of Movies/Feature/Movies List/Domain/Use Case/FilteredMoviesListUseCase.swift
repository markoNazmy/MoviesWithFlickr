//
//  FilteredMoviesListUseCase.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias FilteredMoviesListResult = (Result<[Int: [Movie]], AppError>) -> Void

protocol FilteredMoviesListUseCaseProtocol {
    func excute(key: String, result: @escaping FilteredMoviesListResult)
}

class FilteredMoviesListUseCase: FilteredMoviesListUseCaseProtocol {
    
    var repository: MoviesListingRepositoryProtocol = MoviesListingRepository()
    var oldSearches: [String: [Int: [Movie]]] = [:]
    
    init() {
        
    }
    
    init(repository: MoviesListingRepositoryProtocol) {
        self.repository = repository
    }
    
    func excute(key: String, result: @escaping FilteredMoviesListResult) {
        if let searchResult = oldSearches[key], !searchResult.values.isEmpty {
            result(.success(response: searchResult))
        } else {
            getMovies(withKey: key, result: result)
        }
    }
    
    fileprivate func getMovies(withKey key: String, result: @escaping FilteredMoviesListResult) {
        repository.fetchMoviesList {[weak self] res in
            switch res {
            case .success(let response):
                if let filteredMovies = self?.filter(key: key, movies: response.movies), let categorizedMovies = self?.categorize(filteredMovies) {
                    self?.oldSearches[key] = categorizedMovies
                    result(.success(response: categorizedMovies))
                } else {
                    result(.success(response: [:]))
                }
            case .failure(let error):
                result(.failure(error: error))
            }
        }
    }
    
    fileprivate func filter(key: String, movies: [Movie]?) -> [Movie]? {
        if let searchResult = movies?.filter({ return $0.title?.lowercased().contains(key) ?? false }) {
            let sortedResult = searchResult.sorted { return ($0.rating ?? 0) > ($1.rating ?? 0) }
            return sortedResult
        } else {
            return nil
        }
    }
    
    fileprivate func categorize(_ sortedResult: [Movie]) -> [Int: [Movie]]? {
        let categorizedResult: [Int: [Movie]] = sortedResult.reduce([:]) { (result, movie) in
            var result = result
            if var list = result[movie.year ?? 0] {
                if list.count < 5 {
                    list.append(movie)
                    result[movie.year ?? 0] = list
                } else {
                    return result
                }
            } else {
                result[movie.year ?? 0] = [movie]
            }
            return result
        }
        return categorizedResult
    }
    
}
