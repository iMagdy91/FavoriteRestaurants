 //
//  RestaurantDataManager.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 08.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

class RestaurantDataManager: RestaurantDataSource {
    
    //MARK: - Properties
    private var dataSource: RestaurantDataProvider = RestaurantDataProvider() {
        didSet {
            dataSource.delegate = self
        }
    }
    
    //MARK: - RestaurantDataSource Methods
    func didReceiveRestaurantData(_ data: Any) {
        
    }
    
    func didFailToReadData(_ error: Error) {
        
    }
    
 }
