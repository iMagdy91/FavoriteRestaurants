//
//  RestaurantsViewController+UISearchController.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit

extension RestaurantsViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchController.searchBar.text != "" {
            searchText = searchController.searchBar.text
        }
    }
    
    // MARK: - UISearchControllerDelegate Methods
    func didDismissSearchController(_ searchController: UISearchController) {
        searchText = nil
    }
    
}
