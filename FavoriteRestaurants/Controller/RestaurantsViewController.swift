//
//  RestaurantsViewController.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit
import MBProgressHUD

class RestaurantsViewController: BaseViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView    : UITableView!
    @IBOutlet var sortingButtons: [UIButton]!
    
    //MARK: - Properties
    var searchController            : UISearchController = UISearchController(searchResultsController: nil)
    var restaurantsArray            : [Restaurant]? {
        didSet {
            tableView.reloadData()
        }
    }
    var filteredArray               : [Restaurant]? {
        didSet {
            tableView.reloadData()
        }
    }
    var searchText                  : String? {
        didSet {
            if searchText != nil {
                showFilteredArray = true
            }
            else {
                showFilteredArray = false
            }
        }
    }
    
    var showFilteredArray           : Bool = false {
        didSet {
            if showFilteredArray {
                filteredArray = restaurantStore.filterRestaurantsArray(restaurants: restaurantsArray, restaurantName: searchText)
            }
            else {
                restaurantStore.sortArray(restaurants: &restaurantsArray)
                filteredArray = nil
            }
        }
    }
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    override func setupView() {
        super.setupView()
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.delegate = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    //MARK: - Private Methods
    private func fetchData() {
        MBProgressHUD.showAdded(to: view, animated: true)
        restaurantStore.getListOfRestaurants(completion: {[weak self] (model) in
            guard let strongSelf = self else { return }
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            strongSelf.restaurantsArray = model as? [Restaurant]
        }) {[weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.handleError(error: error)
        }
        
    }
    
    @IBAction func sortingButtonPressed(_ sender: UIButton) {
        for button in sortingButtons {
            button.isSelected = false
        }
        sender.isSelected = true
        //TODO: continue
        
    }
    


}
