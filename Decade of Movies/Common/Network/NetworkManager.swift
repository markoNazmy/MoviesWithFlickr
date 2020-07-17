//
//  NetworkManager.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
import Alamofire

enum Result <T: Codable, E> {
    case success(response: T)
    case failure(error: E)
}

typealias MappedResult<T: Codable> = (Result<T, AppError>) -> Void

class NetworkManager {
    
    var validStatusCodes: CountableClosedRange<Int> {
        return 200...300
    }
    
    var baseUrl: String {
        return "https://api.flickr.com/services/rest"
    }
    
    var defaultHeaders: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    var sharedSessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60.0
        
        let sessionManager: Session = Session(configuration: configuration)
        
        return sessionManager
    }()
    
    static let shared = NetworkManager()
    
    func start<T: Codable>(request: Request, result: @escaping MappedResult<T>) {
        // This "can" be more generic by including it as part of the request but using JSON in the body is a safe assumption
        let encoding: ParameterEncoding
        if request.method == .post {
            encoding = JSONEncoding.default
        } else {
            encoding = URLEncoding(destination: .methodDependent)
        }
        
        sharedSessionManager.request(fullUrlString(fromRequest: request),
                                     method: request.method,
                                     parameters: request.parameters,
                                     encoding: encoding,
                                     headers: HTTPHeaders(headers(fromRequest: request)))
            .validate(statusCode: validStatusCodes)
            .responseDecodable(completionHandler: { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let resp):
                    result(.success(response: resp))
                case .failure(let error):
                    result(.failure(error: AppError(fromError: error)))
                }
            })
    }
    
    // MARK: - Private functions
    
    /// Combines default headers with request headers.
    /// Prefers request headers in case of key duplication.
    private func headers(fromRequest request: Request) -> [String: String] {
        guard let requestHeaders = request.headers else {
            return defaultHeaders
        }
        
        return requestHeaders.merging(defaultHeaders, uniquingKeysWith: { (requestHeaders, _) in requestHeaders })
    }
    
    /// Builds full path of the request using the base URL and path property of the request.
    /// Prefers the request base URL over the client's in case it's provided.
    private func fullUrlString(fromRequest request: Request) -> URLConvertible {
        // Request base URL should overrides client's, if any.
        
        // Base URL should be defined in the client if not already in the request
        let api_key = "e4da209e98e0f25bc11f62169dea2c2f"
        let staticQueryParams = "\(request.path.contains("?") ? "&": "?")api_key=\(api_key)"
        
        if let baseUrl = request.baseUrl {
            return baseUrl + request.path + staticQueryParams
        } else {
            guard !self.baseUrl.isEmpty else {
                fatalError("Generic API client cannot be used without a base URL. Please provide a base URL or use one of the dedicated clients with a predefined base URL.")
            }
            return baseUrl + request.path + staticQueryParams
        }
    }
}
