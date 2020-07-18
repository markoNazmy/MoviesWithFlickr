//
//  MoviesListingViewController.swift
//  Decade of Movies
//
//  Created by marko nazmy on 7/17/20.
//  Copyright © 2020 MarkoNazmy. All rights reserved.
//

import UIKit

class MoviesListingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var emptyView: UIView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    let activityIndicatorView = UIActivityIndicatorView(style: .gray)
    
    var presenter: MoviesListingPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchController()
        setupTableView()
        setupPresenter()
    }
    
    func setupPresenter() {
        presenter = MoviesListingPresenter(view: self)
        presenter.getAllMovies()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: MovieTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 270
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setUpSearchController() {
        searchController.searchBar.placeholder = "Search For Movies"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchBarStyle = .minimal
        navigationItem.titleView = searchController.searchBar
        navigationController?.navigationBar.topItem?.title = ""
        searchController.searchBar.delegate = self
    }
    
    @IBAction func retryButtonTabbed(_ sender: Any) {
        presenter.retryAction?()
    }
  
}
