//
//  MoviesListingPresenter.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

protocol MoviesListingView: class {
    func refreshListWithAnimation()
    func showErrorView()
    func hideErrorView()
    func showLoadingView()
    func hideLoadingView()
    func showEmptyStateView()
    func hideEmptyStateView()
}

class MoviesListingPresenter {
    
    enum ViewMode {
        case singleRow
        case sections
    }
    
    let moviesListingUseCase = MoviesListingUseCase()
    let filteredMoviesListUseCase = FilteredMoviesListUseCase()
    weak var view: MoviesListingView!
    
    var movies: [Movie] = []
    var categorizedMovies: [Int: [Movie]] = [:]
    var viewMode: ViewMode = .singleRow
    var retryAction: (()->(Void))?
    
    let minQueryLength: Int = 3
    
    init(view: MoviesListingView) {
        self.view = view
        view.hideErrorView()
        view.hideEmptyStateView()
    }
    
    func getAllMovies() {
        viewMode = .singleRow
        view.hideErrorView()
        view.hideEmptyStateView()
        view.showLoadingView()
        moviesListingUseCase.excute {[weak self] (result) in
            switch result {
            case .success(let movies):
                self?.movies = movies.movies ?? []
                if movies.movies?.isEmpty == true {
                    self?.view.showEmptyStateView()
                } else {
                    self?.view.refreshListWithAnimation()
                }
            case .failure(_):
                self?.retryAction = {
                    self?.getAllMovies()
                }
                self?.view.showErrorView()
            }
            self?.view.hideLoadingView()
        }
    }
    
    func getAllMovies(withKey key: String) {
        viewMode = .sections
        view.hideErrorView()
        view.hideEmptyStateView()
        view.showLoadingView()
        filteredMoviesListUseCase.excute(key: key) {[weak self] (result) in
            switch result {
            case .success(let categorizedMovies):
                self?.categorizedMovies = categorizedMovies
                self?.movies = categorizedMovies.first?.value ?? []
                if self?.categorizedMovies.values.isEmpty == true {
                    self?.view.showEmptyStateView()
                } else {
                    self?.view.refreshListWithAnimation()
                }
            case .failure(_):
                self?.retryAction = {
                    self?.getAllMovies(withKey: key)
                }
                self?.view.showErrorView()
            }
            self?.view.hideLoadingView()
        }
    }
    
}
