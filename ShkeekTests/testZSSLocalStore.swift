//
//  testZSSLocalStore.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/17/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import XCTest
import CoreData
import Shkeek

class testZSSLocalStore: XCTestCase {

    override func setUp() {
        super.setUp()
        ZSSLocalStore.sharedQuerier.deleteAllObjects()
        println(ZSSLocalStore.sharedQuerier.user())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        XCTAssertNotNil(ZSSLocalStore.sharedQuerier)
    }
    
    func testCreateUser() {
        let user = ZSSLocalStore.sharedQuerier.createUser()!
        XCTAssertNotNil(user)
        
        user.setValue("test@test.com", forKey: "email")
        user.setValue(NSNumber(int: 30), forKey: "reportedCount")
        user.setValue("objectId", forKey: "objectId")
        user.setValue(NSNumber(bool: true), forKey: "isBanned")
        user.setValue(NSNumber(bool: true), forKey: "isEmailConfirmed")

        
        let retrievedUser = ZSSLocalStore.sharedQuerier.user()!
        XCTAssert(retrievedUser.valueForKey("email")!.isEqual("test@test.com"))
        XCTAssert(retrievedUser.valueForKey("reportedCount")!.isEqual(NSNumber(int: 30)))
        XCTAssert(retrievedUser.valueForKey("objectId")!.isEqual("objectId"))
        XCTAssert(retrievedUser.valueForKey("isBanned")!.isEqual(NSNumber(bool: true)))
        XCTAssert(retrievedUser.valueForKey("isEmailConfirmed")!.isEqual(NSNumber(bool: true)))
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

}
