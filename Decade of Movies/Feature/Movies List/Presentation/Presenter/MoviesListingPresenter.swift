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
        case error
        case empty
    }
    
    var moviesListingUseCase: MoviesListingUseCaseProtocol = MoviesListingUseCase()
    var filteredMoviesListUseCase: FilteredMoviesListUseCaseProtocol = FilteredMoviesListUseCase()
    
    weak var view: MoviesListingView!
    
    var movies: [Movie] = []
    var categorizedMovies: [Int: [Movie]] = [:]
    var viewMode: ViewMode = .singleRow
    var retryAction: (() -> Void)?
    
    let minQueryLength: Int = 0
    
    init(view: MoviesListingView) {
        self.view = view
    }
    
    init(view: MoviesListingView, moviesListingUseCase: MoviesListingUseCaseProtocol, filteredMoviesListUseCase: FilteredMoviesListUseCaseProtocol) {
        self.view = view
        self.moviesListingUseCase = moviesListingUseCase
        self.filteredMoviesListUseCase = filteredMoviesListUseCase
    }
    
    func getAllMovies() {
        prepareView()
        view?.showLoadingView()
        moviesListingUseCase.excute {[weak self] (result) in
            switch result {
            case .success(let movies):
                self?.viewMode = .singleRow
                self?.movies = movies.movies ?? []
                if self?.movies.isEmpty == true {
                    self?.viewMode = .empty
                    self?.view?.showEmptyStateView()
                } else {
                    self?.view?.refreshListWithAnimation()
                }
            case .failure:
                self?.retryAction = {
                    self?.getAllMovies()
                }
                self?.viewMode = .error
                self?.view?.showErrorView()
            }
            self?.view?.hideLoadingView()
        }
    }

    func getAllMovies(withKey key: String) {
        prepareView()
        view?.showLoadingView()
        filteredMoviesListUseCase.excute(key: key) {[weak self] (result) in
            switch result {
            case .success(let categorizedMovies):
                self?.viewMode = .sections
                self?.categorizedMovies = categorizedMovies
                self?.movies = categorizedMovies.first?.value ?? []
                if self?.categorizedMovies.values.isEmpty == true {
                    self?.viewMode = .empty
                    self?.view?.showEmptyStateView()
                } else {
                    self?.view?.refreshListWithAnimation()
                }
            case .failure:
                self?.retryAction = {
                    self?.getAllMovies(withKey: key)
                }
                self?.viewMode = .error
                self?.view?.showErrorView()
            }
            self?.view?.hideLoadingView()
        }
    }
    
    func prepareView() {
        view?.hideErrorView()
        view?.hideEmptyStateView()
    }
    
}
