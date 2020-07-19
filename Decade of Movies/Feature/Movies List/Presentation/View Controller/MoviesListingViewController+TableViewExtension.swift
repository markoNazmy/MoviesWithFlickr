//
//  MoviesListingViewController.swift+TableViewExtension.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit

extension MoviesListingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch presenter.viewMode {
        case .singleRow:
            return presenter.movies.count
        case .sections:
            let array = Array(presenter.categorizedMovies)
            return array[section].value.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        var movie: Movie!
        switch presenter.viewMode {
        case .singleRow:
            movie = presenter.movies[indexPath.row]
        case .sections:
            let array = Array(presenter.categorizedMovies)
            movie = array[indexPath.section].value[indexPath.row]
        }
        
        cell.configure(title: movie.title ?? "", rating: movie.rating ?? 0)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        switch presenter.viewMode {
        case .singleRow:
            return 1
        case .sections:
            return presenter.categorizedMovies.values.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch presenter.viewMode {
        case .singleRow:
            return "Movies"
        case .sections:
            let array = Array(presenter.categorizedMovies)
            return "\(array[section].key)"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var movie: Movie!
        switch presenter.viewMode {
        case .singleRow:
            movie = presenter.movies[indexPath.row]
        case .sections:
            let array = Array(presenter.categorizedMovies)
            movie = array[indexPath.section].value[indexPath.row]
        }
        navigateToMovieDetails(movie: movie)
    }
    
}
