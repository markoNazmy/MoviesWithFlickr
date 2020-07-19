//
//  AppError.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
import Alamofire

enum AppError: Error {
    
    case unknown
    case authorization
    case timeout
    case fileNotFound
    
    init(fromError error: AFError?) {
        guard error != nil else {
            self = .unknown
            return
        }
        
        switch error {
        case .responseValidationFailed(let reason):
            switch reason {
            case .unacceptableStatusCode(let code):
                switch code {
                case 401, 403:
                    self = .authorization
                case 408:
                    self = .timeout
                default:
                    self = .unknown
                }
            default:
                self = .unknown
            }
        default:
            self = .unknown
        }
    }
}
