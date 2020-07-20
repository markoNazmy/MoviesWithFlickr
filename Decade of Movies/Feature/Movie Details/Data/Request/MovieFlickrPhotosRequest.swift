//
//  MovieFlickrPhotosRequest.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Alamofire

enum MovieFlickrPhotosRequest: Request {
    
    case movieFlickrPhotosRequest(movieTitle: String, page: Int, photosPerPage: Int)
    
    var baseUrl: String? {
        return nil
    }
    
    var path: String {
        switch self {
        case .movieFlickrPhotosRequest:
            return "/services/rest/"
        }
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
        switch self {
        case .movieFlickrPhotosRequest(let movieTitle, let page, let photosPerPage):
            return ["method": "flickr.photos.search", "format": "json", "nojsoncallback": "1", "text": movieTitle, "page": "\(page)", "per_page": "\(photosPerPage)"]
        }
    }
    
    var requestType: RequestType {
        return .https
    }
}
