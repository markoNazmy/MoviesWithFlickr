//
//  MovieDetailsHeaderView.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit
import Reusable

class MovieDetailsHeaderView: UICollectionReusableView, NibOwnerLoadable, Reusable {
        
    @IBOutlet private weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.layer.masksToBounds = true
            movieImageView.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var genresLabel: UILabel!
    @IBOutlet private weak var castLabel: UILabel!
    
    @IBOutlet private weak var yearView: UIView!
    @IBOutlet private weak var genresView: UIView!
    @IBOutlet private weak var castView: UIView!
    
    private let stackViewSpacing: CGFloat = 4
    private let bottomSpacing: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadNibContent()
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: calculateHeight())
    }
    
    func calculateHeight() -> CGFloat {
        titleLabel.sizeToFit()
        let titleLabelHeight = titleLabel.intrinsicContentSize.height
        yearLabel.sizeToFit()
        let yearLabelHeight = yearLabel.intrinsicContentSize.height
        genresLabel.sizeToFit()
        let genresLabelHeight = genresLabel.intrinsicContentSize.height
        castLabel.sizeToFit()
        let castLabelHeight = castLabel.intrinsicContentSize.height
        var spacingFactor: CGFloat = 1
        if !genresLabel.isHidden && !castLabel.isHidden {
            spacingFactor = 3
        } else if !genresLabel.isHidden || !castLabel.isHidden {
            spacingFactor = 2
        }
        return titleLabelHeight + yearLabelHeight + castLabelHeight + genresLabelHeight + (stackViewSpacing * spacingFactor) + bottomSpacing
    }
    
    func configure(title: String, year: Int, genres: String?, cast: String?) {
        if let genres = genres {
            genresView.isHidden = false
            genresLabel.text = genres
        } else {
            genresView.isHidden = true
        }
        
        if let cast = cast {
            castView.isHidden = false
            castLabel.text = cast
        } else {
            castView.isHidden = true
        }
        
        titleLabel.text = title
        yearLabel.text = "\(year)"
    }
    
    func configureMovieImageView(url: String) {
        if let url = URL(string: url) {
            movieImageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "poster-placeholder"), options: [.transition(.fade(0.2))])
        }
    }
}
