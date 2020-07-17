//
//  Fetcher.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
import Alamofire

typealias MappedResult<T: Codable> = (Result<T, AppError>) -> Void

protocol Fetcher {
    
    // MARK: - Properties
    var validStatusCodes: CountableClosedRange<Int> { get }
    // MARK: - Public functions
    
    /// Initiates a request, validates the response and maps the result to the supplied model or an error.
    func start<T: Codable>(request: Request, result: @escaping MappedResult<T>)
    func prepareRequest<T: Codable>(request: Request, result: @escaping MappedResult<T>) -> URLRequest?
}

extension Fetcher {
    func start<T: Codable>(request: Request, result: @escaping MappedResult<T>) {
        if let urlRequest: URLRequest = prepareRequest(request: request, result: result) {
            AF.request(urlRequest)
                .validate(statusCode: validStatusCodes)
                .responseDecodable(completionHandler: { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let resp):
                        result(.success(response: resp))
                    case .failure(let error):
                        result(.failure(error: AppError(fromError: error)))
                    }
                }
            )
        }
    }
}
