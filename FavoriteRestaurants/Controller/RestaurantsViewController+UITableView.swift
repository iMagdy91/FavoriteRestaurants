//
//  RestaurantsViewController+UITableView.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit

extension RestaurantsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    //MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return showFilteredArray ? (filteredArray?.count ?? 0) : (restaurantsArray?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return constructCellForTableView(tableView:tableView, atIndexPath:indexPath)
    }
    
    // MARK: - Cell Construction Methods
    private func constructCellForTableView(tableView: UITableView,
                                           atIndexPath indexPath: IndexPath) -> RestaurantTableViewCell {
        let cell: RestaurantTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.restaurantCellIdentifier) as? RestaurantTableViewCell
        
        let restaurant = showFilteredArray ? filteredArray?[indexPath.row] : restaurantsArray?[indexPath.row]
        
        cell?.customizeCellWithModel(restaurant)
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        //TODO: Favorite status is not being persisted, as this is just a POC
        var restaurant: Restaurant?
        if showFilteredArray {
            restaurant =  filteredArray?[indexPath.row]
            restaurant?.isFavorite = !(restaurant?.isFavorite ?? false)
            restaurantStore.sortArray(restaurants: &filteredArray)
        }
        else {
            restaurant =  restaurantsArray?[indexPath.row]
            restaurant?.isFavorite = !(restaurant?.isFavorite ?? false)
            restaurantStore.sortArray(restaurants: &restaurantsArray)
        }
        tableView.reloadData()
    }
    
}
