//
//  MovieDetailsViewController+MovieDetailsViewExtension.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

extension MovieDetailsViewController: MovieDetailsView {
    
    func refreshCollectionView() {
        collectionView.reloadData()
    }
    
    func setupMovieMainPhoto(url: String) {
        movieDetailsHeaderView?.configureMovieImageView(url: url)
    }
    
}
