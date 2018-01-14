//
//  RestaurantDataProvider.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 08.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

fileprivate let jsonFileName        : String = "sample iOS"

@objc protocol RestaurantDataSource{
    func didReceiveRestaurantData(_ data: Any)
    func didFailToReadData(_ error: Error)
}

class RestaurantDataProvider {
    
    //MARK: - Properties
    weak var delegate: RestaurantDataSource? {
        didSet {
            readJsonDataFromFile()
        }
    }
    
    //MARK: - Private Methods
    private func readJsonDataFromFile() {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            guard let strongDelegate = delegate else { return }
            DispatchQueue.main.async {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    strongDelegate.didReceiveRestaurantData(jsonResult)
                }
                catch {
                    strongDelegate.didFailToReadData(error)
                }
            }
        }
    }

    
}
