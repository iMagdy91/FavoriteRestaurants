//
//  String+Utils.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 15.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

extension String {
    func containsIgnoringCase(find: String?) -> Bool
    {
        return self.range(of: find ?? "", options: .caseInsensitive) != nil
    }
}
