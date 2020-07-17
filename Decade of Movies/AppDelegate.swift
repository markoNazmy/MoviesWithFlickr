//
//  AppDelegate.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let fiveDaysInSeconds: Double = 432000
    let imageCacheSizeLimit: Int = 20000000
    // MARK: - Application Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupKingfisher()
        return true
    }
    
    func setupKingfisher() {
        ImageCache.default.memoryStorage.config.totalCostLimit = imageCacheSizeLimit // 20MB
        ImageCache.default.diskStorage.config.sizeLimit = 0
        ImageCache.default.diskStorage.config.expiration = StorageExpiration.seconds(fiveDaysInSeconds)
    }

}

