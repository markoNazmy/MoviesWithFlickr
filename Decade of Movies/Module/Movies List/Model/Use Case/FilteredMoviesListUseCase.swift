//
//  FilteredMoviesListUseCase.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

typealias FilteredMoviesListResult = (Result<[Int: [Movie]], AppError>) -> (Void)

class FilteredMoviesListUseCase {
    
    var oldSearches: [String: [Int: [Movie]]] = [:]
    
    func excute(key: String, result: @escaping FilteredMoviesListResult) {
        if let searchResult = oldSearches[key], !searchResult.values.isEmpty {
            result(.success(response: searchResult))
        } else {
            MoviesListingRepository.fetchMoviesList {[weak self] res in
                switch res {
                case .success(let response):
                    if let moviesDic = self?.filterAndCategorize(key: key, movies: response.movies) {
                        self?.oldSearches[key] = moviesDic
                        result(.success(response: moviesDic))
                    } else {
                        result(.success(response: [:]))
                    }
                    
                case .failure(let error):
                    result(.failure(error: error))
                }
            }
        }
    }
    
    func filterAndCategorize(key: String, movies: [Movie]?) -> [Int: [Movie]]? {
        if let searchResult = movies?.filter({ return $0.title?.lowercased().contains(key) ?? false}) {
            let sortedResult = searchResult.sorted { return ($0.rating ?? 0) > ($1.rating ?? 0) }
            let categorizedResult: [Int: [Movie]] = sortedResult.reduce([:]) { (result, movie) in
                var result = result
                if var arr = result[movie.year ?? 0], arr.count < 5 {
                    arr.append(movie)
                    result[movie.year ?? 0] = arr
                } else {
                    result[movie.year ?? 0] = [movie]
                }
                return result
            }
            return categorizedResult
        } else {
            return nil
        }
    }
    
}
