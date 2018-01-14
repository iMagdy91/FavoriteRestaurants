//
//  RestaurantTableViewCell.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet private weak var restaurantNameLabel: UILabel!
    @IBOutlet private weak var restaurantStatusLabel: UILabel!
    @IBOutlet private weak var restaurantDistanceLabel: UILabel!
    @IBOutlet private weak var restaurantRatingLabel: UILabel!
    @IBOutlet private weak var favoriteImageView: UIImageView!
    
    
    //MARK: - Cell Customization
    func customizeCellWithModel(_ model: Restaurant?) {
        restaurantNameLabel.text        = model?.name
        restaurantStatusLabel.text      = model?.status
        restaurantRatingLabel.text      = "Rating: " + String(model?.sortingValues?.ratingAverage ?? 0)
        restaurantDistanceLabel.text    = "Distance: " + String(model?.sortingValues?.distance ?? 0)
        
        favoriteImageView.image = (model?.isFavorite ?? false) ? #imageLiteral(resourceName: "Favorite") : nil
    }
}
