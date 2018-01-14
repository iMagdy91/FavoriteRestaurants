//
//  RestaurantModel.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation
import ObjectMapper

// DTO Class to parse content of Restaurants file.
class RestaurantModel: BaseModel {
    
    // MARK: - Properties
    private(set) var restaurants          : [Restaurant]?
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        restaurants           <- map["restaurants"]
    }
}

class Restaurant: BaseModel {
    
    // MARK: - Properties
    private(set) var name                 : String?
    private(set) var sortingValues        : SortingValues?
    private(set) var status               : String?
    var isFavorite                        : Bool = false
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        name                <- map["name"]
        sortingValues       <- map["sortingValues"]
        status              <- map["status"]
    }
}

class SortingValues: BaseModel {
    
    // MARK: - Properties
    private(set) var bestMatch              : Int?
    private(set) var newest                 : Int?
    private(set) var ratingAverage          : Double?
    private(set) var distance               : Int?
    private(set) var popularity             : Int?
    private(set) var averageProductPrice    : Int?
    private(set) var deliveryCosts          : Int?
    private(set) var minCost                : Int?
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        bestMatch            <- map["bestMatch"]
        newest               <- map["newest"]
        ratingAverage        <- map["ratingAverage"]
        distance             <- map["distance"]
        popularity           <- map["popularity"]
        averageProductPrice  <- map["averageProductPrice"]
        deliveryCosts        <- map["deliveryCosts"]
        minCost              <- map["minCost"]
    }
}
