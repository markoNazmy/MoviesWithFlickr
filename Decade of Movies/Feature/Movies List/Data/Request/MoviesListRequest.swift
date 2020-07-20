//
//  MoviesListRequest.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Alamofire

enum MoviesListRequest: Request {
    
    case getLocalMovies
    
    var baseUrl: String? {
        return nil
    }
    
    var path: String {
        return ""
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return .returnCacheDataElseLoad
    }
    
    var parameters: [String: String]? {
        return nil
    }
    
    var requestType: RequestType {
        return .localfile(fileName: "movies", fileExt: "json")
    }
    
}
