//
//  BaseControllerProtocol.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - Properties
    var restaurantStore                     : RestaurantStore = RestaurantStore()
    
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Utils
    func handleError(error: Error) {
        showMessage(message: error.localizedDescription)
    }
    func setupView() {
        
    }
    private func showMessage(message: String) {
        let alertController = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
}
