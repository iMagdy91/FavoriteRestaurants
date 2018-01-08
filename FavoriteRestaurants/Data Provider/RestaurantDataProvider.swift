//
//  RestaurantDataProvider.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 08.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

@objc protocol RestaurantDataSource{
    func didReceiveRestaurantData(_ data: Any)
}

class RestaurantDataProvider {
    
    weak var delegate: RestaurantDataSource? {
        didSet {
            
        }
    }
    
}
