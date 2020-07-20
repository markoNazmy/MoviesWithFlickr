//
//  NetworkFetcher.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Alamofire

struct NetworkFetcher: Fetcher {
    var validStatusCodes: CountableClosedRange<Int> {
        return 200...300
    }
    
    var baseUrl: String {
        return "api.flickr.com"
    }
    
    var defaultHeaders: [String: String] {
        return ["Content-Type": "application/json"]
    }

    static let shared = NetworkFetcher()
    
    func prepareRequest<T: Codable>(request: Request, result: @escaping MappedResult<T>) -> URLRequest? {
        var urlRequest: URLRequest = URLRequest(url: fullUrlString(fromRequest: request), cachePolicy: request.cachePolicy, timeoutInterval: 60.0)
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
        let apiKey = "e4da209e98e0f25bc11f62169dea2c2f"
        
        var queryItems: [URLQueryItem] = []
        
        if let parameters = request.parameters {
            for param in parameters {
                queryItems.append(URLQueryItem(name: param.key, value: param.value))
            }
        }
        
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        
        let scheme = "https"
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = request.baseUrl ?? baseUrl
        urlComponents.path = request.path
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
    
}
