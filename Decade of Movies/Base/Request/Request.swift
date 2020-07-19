//
//  Request.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Alamofire

enum RequestType {
    case https
    case localfile(fileName: String, fileExt: String)
}

protocol Request {
    
    // The request base URL.
    // It's optional and can be moved to a Request extension. Usually defined by the `Client`.
    var baseUrl: String? { get }
    
    // The request path.
    var path: String { get }
    
    // The request method.
    var method: HTTPMethod { get }
    
    // The request headers.
    // It's optional and can be moved to a Request extension. Usually defined by the `Client`.
    var headers: [String: String]? { get }
    
    // The request cache policy.
    var cachePolicy: URLRequest.CachePolicy { get }
    
    // The request parameters.
    var parameters: [String: String]? { get }
    
    // The request type as file or HTTPS request.
    var requestType: RequestType { get }
}
