//
//  BaseStore.swift
//  FavoriteRestaurants
//
//  Created by Mohamed Magdy on 14.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

protocol BaseStore {
    typealias ErrorClosure              = (Error) -> Void
    typealias UISuccessClosure          = ([BaseModel]?) -> Void
    typealias BusinessSuccessClosure    = (BaseModel?) -> Void
}
