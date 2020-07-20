//
//  LocalJsonFetcher.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

struct LocalJsonFetcher: Fetcher {
    
    var validStatusCodes: CountableClosedRange<Int> {
        return 200...300
    }
    
    static let shared = LocalJsonFetcher()
    
    func prepareRequest<T: Codable>(request: Request, result: @escaping MappedResult<T>) -> URLRequest? {
        switch request.requestType {
        case .localfile(let fileName, let fileExt):
            if let path = Bundle.main.path(forResource: fileName, ofType: fileExt) {
                let url = URL(fileURLWithPath: path)
                let urlRequest = URLRequest(url: url, cachePolicy: request.cachePolicy, timeoutInterval: 60.0)
                return urlRequest
            } else {
                result(.failure(error: AppError.fileNotFound))
                return nil
            }
        default:
            return nil
        }
    }
    
}
