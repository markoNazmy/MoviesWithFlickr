//
//  MoviesListingViewController+MoviesListingViewExtension.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation

extension MoviesListingViewController: MoviesListingView {
    
    func refreshListWithAnimation() {
        tableView.isHidden = false
        tableView.reloadData()
        tableView.fade()
    }
    
    func showErrorView() {
        tableView.isHidden = true
        errorView.isHidden = false
        errorView.fade()
    }
  
    func hideErrorView() {
        tableView.isHidden = false
        errorView.isHidden = true
    }
    
    func showLoadingView() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = tableView.center
        activityIndicatorView.startAnimating()
    }
    
    func hideLoadingView() {
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
    }
    
    func showEmptyStateView() {
        tableView.isHidden = true
        emptyView.isHidden = false
        emptyView.fade()
    }
    
    func hideEmptyStateView() {
        tableView.isHidden = false
        emptyView.isHidden = true
    }
    
}
