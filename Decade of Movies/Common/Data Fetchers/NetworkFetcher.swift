//
//  NetworkFetcher.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkFetcher: Fetcher {
    var validStatusCodes: CountableClosedRange<Int> {
        return 200...300
    }
    
    var baseUrl: String {
        return "https://api.flickr.com/services/rest"
    }
    
    var defaultHeaders: [String: String] {
        return ["Content-Type": "application/json"]
    }

    static let shared = NetworkFetcher()
    
    func prepareRequest<T: Codable>(request: Request, result: @escaping MappedResult<T>) -> URLRequest? {
        var urlRequest: URLRequest =  URLRequest(url: fullUrlString(fromRequest: request), cachePolicy: request.cachePolicy, timeoutInterval: 60.0)
        urlRequest.method = request.method
        urlRequest.headers = HTTPHeaders(headers(fromRequest: request))
        return urlRequest
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
    private func fullUrlString(fromRequest request: Request) -> URL {
        // Request base URL should overrides client's, if any.
        
        // Base URL should be defined in the client if not already in the request
        let api_key = "e4da209e98e0f25bc11f62169dea2c2f"
        let staticQueryParams = "\(request.path.contains("?") ? "&": "?")api_key=\(api_key)"
        
        if let baseUrl = request.baseUrl {
            return URL(string: baseUrl + request.path + staticQueryParams)!
        } else {
            guard !self.baseUrl.isEmpty else {
                fatalError("Generic API client cannot be used without a base URL. Please provide a base URL or use one of the dedicated clients with a predefined base URL.")
            }
            return URL(string: baseUrl + request.path + staticQueryParams)!
        }
    }
    
}
