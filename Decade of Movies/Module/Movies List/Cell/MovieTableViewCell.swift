//
//  MovieTableViewCell.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class MovieTableViewCell: UITableViewCell, NibOwnerLoadable, Reusable {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet private var ratingImages: [UIImageView]!
    
    func configure(title: String, rating: Int) {
        titleLabel.text = title
        for index in 0...ratingImages.count - 1 {
            if index < rating {
                ratingImages[index].image = #imageLiteral(resourceName: "heart-full")
            } else {
                ratingImages[index].image = #imageLiteral(resourceName: "heart-empty")
            }
        }
    }
}
