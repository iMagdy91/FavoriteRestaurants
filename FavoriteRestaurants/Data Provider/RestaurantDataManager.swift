 //
//  RestaurantDataManager.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 08.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation
import ObjectMapper
 
class RestaurantDataManager: RestaurantDataSource, BaseStore {
    
    //MARK: - Properties
    private var dataSource                       : RestaurantDataProvider = RestaurantDataProvider()
    private var restaurantModelClosure           : BusinessSuccessClosure?
    private var restaurantFailureClosure         : ErrorClosure?
    
    //MARK: - Init
    required init(_ restaurantModelClosure: @escaping BusinessSuccessClosure,
                  restaurantFailureClosure: @escaping ErrorClosure) {
        self.restaurantModelClosure     = restaurantModelClosure
        self.restaurantFailureClosure   = restaurantFailureClosure
        self.dataSource.delegate        = self
    }
    
    //MARK: - RestaurantDataSource Methods
    func didReceiveRestaurantData(_ data: Any) {
        parseDataIntoModel(data)
    }
    
    func didFailToReadData(_ error: Error) {
        restaurantFailureClosure?(error)
    }
    
    //MARK: - Private Methods
    private func parseDataIntoModel(_ data: Any) {
        let restaurantModel: RestaurantModel? = Mapper<RestaurantModel>().map(JSONObject: data)
        restaurantModelClosure?(restaurantModel)
    }
    
 }
