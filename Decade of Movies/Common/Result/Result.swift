//
//  Result.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

enum Result <T: Codable, E> {
    case success(response: T)
    case failure(error: E)
}
