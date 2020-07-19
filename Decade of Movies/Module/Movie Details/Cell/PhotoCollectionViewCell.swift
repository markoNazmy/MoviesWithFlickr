//
//  PhotoCollectionViewCell.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

public class PhotoCollectionViewCell: UICollectionViewCell, NibOwnerLoadable, Reusable {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 5
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadNibContent()
    }
    
    func configureImageView(url: String) {
        if let url = URL(string: url) {
            imageView.kf.indicatorType = .activity
            self.imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
}
