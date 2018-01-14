//
//  RestaurantStore.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation
import SwiftKVC

enum SortingOptions {
    case bestMatch
    case newest
    case ratingAverage
    case distance
    case popularity
    case averageProductPrice
    case deliveryCost
    case minCost
}

class RestaurantStore: BaseStore {
    
    
    //MARK: - Methods
    /**
     Requests and filters Doctors list near you.
     - Parameter completion: Callback with the result array.
     - Parameter failure: Error callback.
     */
    
    func getListOfRestaurants(completion success: @escaping UISuccessClosure,
                              failure: @escaping ErrorClosure) {
        let _ = RestaurantDataManager({[weak self] (model) in
            guard let strongSelf = self else { return }
            if let restaurantModel = model as? RestaurantModel {
                
                success(strongSelf.sortArray(restaurants: restaurantModel.restaurants, sortingOption: .distance))
            }
        }, restaurantFailureClosure: failure)
    }
    
    /**
     Filter the restaurants by the required options.
     - Parameter restaurants: Restaurants array to be filtered.
     - Parameter restaurantName: filter the array with this string.
     - Parameter sortingOption: Sort the filtered array by one of the avaiable options.
     - Returns : The filtered array.
     */
    func filterRestaurantsArray(restaurants: [Restaurant]?,
                                restaurantName: String?,
                                sortingOption: SortingOptions) -> [Restaurant]? {
        let filteredArray = restaurants?.filter{ $0.name == restaurantName }
        return sortArray(restaurants: filteredArray, sortingOption: .distance)
    }
    
    
    /**
     Sort the restaurants array.
     - Parameter restaurants: Restaurants array to be sorted.
     - Parameter sortingOption: Sort the filtered array by one of the avaiable options.
     - Returns : The sorted array.
     */
    func sortArray(restaurants: [Restaurant]?,
                   sortingOption: SortingOptions) -> [Restaurant]? {
        var sortingOptionStr   :String?
        switch sortingOption {
        case .averageProductPrice:
            sortingOptionStr = "averageProductPrice"
        case .bestMatch:
            sortingOptionStr = "bestMatch"
        case .deliveryCost:
            sortingOptionStr = "deliveryCosts"
        case .distance:
            sortingOptionStr = "distance"
        case .minCost:
            sortingOptionStr = "minCost"
        case .newest:
            sortingOptionStr = "newest"
        case .popularity:
            sortingOptionStr = "popularity"
        case .ratingAverage:
            sortingOptionStr = "ratingAverage"
        }
        
        return restaurants?.sorted(by: { (s1, s2) -> Bool in
            if s1.isFavorite && !s2.isFavorite {
                return true
            }
            if !s1.isFavorite && s2.isFavorite {
                return false
            }
            if s1.isFavorite == s2.isFavorite {
                if s1.status == "open" && s2.status == "open" {
                    return s1.sortingValues!.distance! < s2.sortingValues!.distance!
                }
                return s1.status == "open"
            }
            return false
        })
    }
}
