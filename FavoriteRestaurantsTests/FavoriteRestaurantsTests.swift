//
//  FavoriteRestaurantsTests.swift
//  FavoriteRestaurantsTests
//
//  Created by Mohamed Magdy on 08.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import XCTest
@testable import FavoriteRestaurants

class FavoriteRestaurantsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //A single test case to prove the concept!
    
    func testDataManager() {
        
        let expectations: XCTestExpectation = expectation(description: "Testing DataManager")
        let _  : RestaurantDataManager  = RestaurantDataManager({(model) in
            XCTAssertNotNil(model)
            expectations.fulfill()
        }) { (error) in
            XCTFail("##ERROR happened: \(error)")
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { error in
            if let error = error {
                XCTFail("waitForExpectationsTimeout error: \(error)")
            }
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {[weak self] in
            self?.testDataManager()
        }
    }
    
}
