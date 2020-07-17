//
//  ViewController.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LocalJsonFetcher.shared.start(request: MoviesListRequest.getLocalMovies) { (result: Result<Movies, AppError>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

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
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return .returnCacheDataElseLoad
    }
    
    var requestType: RequestType {
        return .localfile(fileName: "movies", fileExt: "json")
    }

}

// MARK: - Movies
struct Movies: Codable {
    let movies: [Movie]?
}

// MARK: - Movie
struct Movie: Codable {
    let title: String?
    let year: Int?
    let cast: [String]?
    let genres: [String]?
    let rating: Int?
}

