//
//  MovieDetailsViewController+UICollectionViewExtension.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/19/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
import UIKit

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        
        switch presenter.viewMode {
        case .data:
            return presenter?.photos.count ?? 0
        case .empty, .error:
            return 1
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch presenter.viewMode {
        case .data:
            presenter.pageIfNeeded(indexPath: indexPath)
            let photoCell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            let photo = presenter.photos[indexPath.row]
            photoCell.configureImageView(url: photo)
            return photoCell
        case .empty:
            let emptyCell: EmptyCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return emptyCell
        case .error:
            let errorCell: ErrorCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            errorCell.configureImageView { [weak self] in
                self?.presenter.getMoviePhotos()
            }
            return errorCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        movieDetailsHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath, viewType: MovieDetailsHeaderView.self)
        movieDetailsHeaderView.configure(title: presenter.movie.title ?? "", year: presenter.movie.year ?? 0, genres: presenter.getFullString(array: presenter.movie.genres), cast: presenter.getFullString(array: presenter.movie.cast))
        return movieDetailsHeaderView
    }
    
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch presenter.viewMode {
        case .data:
            return CGSize(width: (collectionView.frame.width / 2) - 5, height: (collectionView.frame.width / 2))
        case .empty, .error:
            return CGSize(width: collectionView.frame.width, height: (view.frame.height / 2))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if let headerView = movieDetailsHeaderView {
            return headerView.intrinsicContentSize
        } else {
            return CGSize(width: 1.0, height: 1.0)
        }
    }
}
