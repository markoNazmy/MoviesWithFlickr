//
//  MovieDetailsViewController.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionView!
    
    var movieDetailsHeaderView: MovieDetailsHeaderView!
    
    var movie: Movie!
    var presenter: MovieDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = movie.title ?? ""
        setupCollectionView()
        setupPresenter()
    }
    
    fileprivate func setupPresenter() {
        presenter = MovieDetailsPresenter(view: self)
        presenter.movie = movie
        presenter.getMoviePhotos()
        presenter.getMovieMainPhoto()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        flowLayout.delegate = self
        collectionView.register(supplementaryViewType: MovieDetailsHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader)
        collectionView.register(cellType: PhotoCollectionViewCell.self)
        collectionView.register(cellType: EmptyCollectionViewCell.self)
        collectionView.register(cellType: ErrorCollectionViewCell.self)
    }

}
