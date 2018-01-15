//
//  RestaurantStore.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

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
    
    /**
     Sort the restaurants by this option.
     */
    var sortingOption: SortingOptions = .bestMatch
    
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
                strongSelf.sortArray(restaurants: &restaurantModel.restaurants)
                success(restaurantModel.restaurants)
            }
        }, restaurantFailureClosure: failure)
    }
    
    /**
     Filter the restaurants by the required options.
     - Parameter restaurants: Restaurants array to be filtered.
     - Parameter restaurantName: filter the array with this string.
     - Returns : The filtered array.
     */
    func filterRestaurantsArray(restaurants: [Restaurant]?,
                                restaurantName: String?) -> [Restaurant]? {
        var filteredArray = restaurants?.filter{ ($0.name ?? "" ).containsIgnoringCase(find: restaurantName)  }
        sortArray(restaurants: &filteredArray)
        return filteredArray
    }
    
    
    /**
     Sort the restaurants array.
     - Parameter restaurants: Restaurants array to be sorted.
     */
    func sortArray(restaurants: inout [Restaurant]?) {
        
        restaurants = restaurants?.sorted(by: { (s1, s2) -> Bool in
            if s1.isFavorite == s2.isFavorite {
                if s1.status == s2.status  {
                    switch sortingOption {
                    case .bestMatch:
                        return s1.sortingValues.bestMatch < s2.sortingValues.bestMatch
                    case .newest:
                        return s1.sortingValues.newest < s2.sortingValues.newest
                    case .ratingAverage:
                        return s1.sortingValues.ratingAverage < s2.sortingValues.ratingAverage
                    case .distance:
                        return s1.sortingValues.distance < s2.sortingValues.distance
                    case .popularity:
                        return s1.sortingValues.popularity < s2.sortingValues.popularity
                    case .averageProductPrice:
                        return s1.sortingValues.averageProductPrice < s2.sortingValues.averageProductPrice
                    default:
                        return s1.sortingValues.bestMatch < s2.sortingValues.bestMatch
                    }
                }
                return s1.status == "open"
            }
            return s1.isFavorite && !s2.isFavorite
        })
    }
}
