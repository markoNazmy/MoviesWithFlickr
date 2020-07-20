//
//  MoviesListing.swift
//  Decade of MoviesTests
//
//  Created by marko nazmy on 7/20/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
@testable import Decade_of_Movies

struct MoviesListingSuccessFetcherMock: Fetcher {
    var validStatusCodes: CountableClosedRange<Int> = 200...300
    
    func prepareRequest<T: Codable>(request: Request, result: @escaping MappedResult<T>) -> URLRequest? {
        return nil
    }
    
    func start<T: Codable>(request: Request, result: @escaping MappedResult<T>) {
        let res = Result<T, AppError>.success(response: moviesResponse as! T)
        result(res)
    }
    
}

struct MoviesListingFailureFetcherMock: Fetcher {
    var validStatusCodes: CountableClosedRange<Int> = 200...300

    func prepareRequest<T: Codable>(request: Request, result: @escaping MappedResult<T>) -> URLRequest? {
        return nil
    }
    
    func start<T: Codable>(request: Request, result: @escaping MappedResult<T>) {
        result(.failure(error: AppError(fromError: nil)))
    }
    
}
