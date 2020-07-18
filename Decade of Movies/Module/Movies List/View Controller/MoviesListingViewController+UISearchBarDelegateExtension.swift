//
//  MoviesListingViewController+UISearchBarDelegateExtension.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/18/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import Foundation
import UIKit

extension MoviesListingViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchQuery = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() ?? ""
        presenter.getAllMovies(withKey: searchQuery)
        tableView.scrollsToTop = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchQuery = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() ?? "" // check minimum length after removing extra space
        if searchQuery.count >= presenter.minQueryLength {
            presenter.getAllMovies(withKey: searchQuery)
            tableView.scrollsToTop = true
        } else if searchQuery.isEmpty {
            presenter.getAllMovies()
            tableView.scrollsToTop = true
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty == false {
            presenter.getAllMovies()
            tableView.scrollsToTop = true
        }
        searchBar.text = ""
    }
    
}
