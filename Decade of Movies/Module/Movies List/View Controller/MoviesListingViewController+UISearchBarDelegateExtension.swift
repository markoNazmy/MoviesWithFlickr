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
        if !searchQuery.isEmpty {
            presenter.getAllMovies(withKey: searchQuery)
            scrollToTop()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchQuery = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() ?? "" // check minimum length after removing extra space
        if searchQuery.count >= presenter.minQueryLength && !searchQuery.isEmpty {
            presenter.getAllMovies(withKey: searchQuery)
        } else if searchQuery.isEmpty {
            presenter.getAllMovies()
        }
        scrollToTop()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty == false {
            presenter.getAllMovies()
            scrollToTop()
        }
        searchBar.text = ""
    }
    
}
