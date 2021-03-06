

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
        
        ZSSLocalStore.sharedQuerier.deleteUser()
        XCTAssertNil(ZSSLocalStore.sharedQuerier.user(), "Deleted user should be nil")
    }
    
    func testCreatGroup() {
        let group = ZSSLocalStore.sharedQuerier.createGroup()
        XCTAssertNotNil(group)
        
        group.setValue("testCode", forKey: "code")
        group.setValue(NSNumber(int: 3000), forKey: "followerCount")
        group.setValue(NSNumber(bool: true), forKey: "isBanned")
        group.setValue(NSNumber(bool: true), forKey: "isHidden")
        group.setValue(NSNumber(bool: true), forKey: "isPrivate")
        group.setValue(NSNumber(bool: true), forKey: "isPublic")
        group.setValue(NSNumber(bool: true), forKey: "isPremium")
        group.setValue("testGroupName", forKey: "name")
        group.setValue("testObjectId", forKey: "objectId")
        
        let retrievedGroup : NSManagedObject = ZSSLocalStore.sharedQuerier.fetchGroupWithObjectId(objectId: "testObjectId")! as NSManagedObject
        XCTAssert(retrievedGroup.valueForKey("code")!.isEqual("testCode"))
        XCTAssert(retrievedGroup.valueForKey("followerCount")!.isEqual(NSNumber(int: 3000)))
        XCTAssert(retrievedGroup.valueForKey("isBanned")!.isEqual(NSNumber(bool: true)))
        XCTAssert(retrievedGroup.valueForKey("isHidden")!.isEqual(NSNumber(bool: true)))
        XCTAssert(retrievedGroup.valueForKey("isPrivate")!.isEqual(NSNumber(bool: true)))
        XCTAssert(retrievedGroup.valueForKey("isPublic")!.isEqual(NSNumber(bool: true)))
        XCTAssert(retrievedGroup.valueForKey("isPremium")!.isEqual(NSNumber(bool: true)))
        XCTAssert(retrievedGroup.valueForKey("name")!.isEqual("testGroupName"))
        XCTAssert(retrievedGroup.valueForKey("objectId")!.isEqual("testObjectId"))
        
        let groupCountBeforeDelete : Int = ZSSLocalStore.sharedQuerier.groups()!.count
        
        ZSSLocalStore.sharedQuerier.deleteGroup(group: retrievedGroup)
        var groupCountAfterDelete : Int = ZSSLocalStore.sharedQuerier.groups()!.count
        
        XCTAssertEqual(groupCountBeforeDelete, groupCountAfterDelete + 1)
        
    }

}
