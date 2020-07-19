//
//  DataStoreFactory.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

struct DataStoreFactory {
    enum FetcherType {
        case local
        case network
    }
    
    static func getFetcher(type: FetcherType) -> Fetcher {
        switch type {
        case .local:
            return LocalJsonFetcher.shared
        case .network:
            return NetworkFetcher.shared
        }
    }
}
