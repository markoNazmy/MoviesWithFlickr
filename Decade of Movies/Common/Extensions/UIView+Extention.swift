//
//  UIView+Extention.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit

extension UIView {
    
    public enum AnimationDuration {
        public static let standard: TimeInterval = 0.1
        public static let short: TimeInterval = 0.6
        public static let long: TimeInterval = 1.2
    }

    public func fade(duration: TimeInterval = AnimationDuration.short) {
        self.alpha = 0.0
        UIView.animate(withDuration: duration) {
            self.alpha = 1.0
        }
    }
    
}
