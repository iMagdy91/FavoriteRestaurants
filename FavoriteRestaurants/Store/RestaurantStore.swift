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
    
    
    //MARK: - Methods
    /**
     Requests and filters Doctors list near you.
     - Parameter completion: Callback with the result array.
     - Parameter failure: Error callback.
     */
    
    func getListOfRestaurants(completion success: @escaping UISuccessClosure,
                              failure: @escaping ErrorClosure) {
        let _ = RestaurantDataManager({ (model) in
            if let restaurantModel = model as? RestaurantModel {
                success(restaurantModel.restaurants)
            }
        }, restaurantFailureClosure: failure)
    }
    
}
