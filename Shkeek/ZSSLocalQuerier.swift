//
//  ZSSLocalQuerier.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/18/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData

class ZSSLocalQuerier: NSObject {
 
    class var sharedQuerier: ZSSLocalQuerier {
        struct Static {
            static let instance: ZSSLocalQuerier = ZSSLocalQuerier()
        }
        return Static.instance
    }
    
    func userDidFillOutUserInfoForm() -> Bool {
        if ZSSLocalStore.sharedQuerier.userExists() {
            let localUser : NSManagedObject = ZSSLocalStore.sharedQuerier.user()!
            return (localUser.valueForKey("didFillOutUserInfoForm") as NSNumber).boolValue
        } else {
            return false
        }
    }
    
    func currentUser() -> NSManagedObject {
        if let user = ZSSLocalStore.sharedQuerier.user() {
            return user
        }
        return ZSSLocalFactory.sharedFactory.createUser()!
    }
    
}
