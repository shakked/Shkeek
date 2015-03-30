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
            if let didFillOutUserInfoForm = (localUser.valueForKey("didFillOutUserInfoForm") as? NSNumber)? {
                return didFillOutUserInfoForm.boolValue
            }
            return false
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
    
    func groups() -> [NSManagedObject] {
        return ZSSLocalStore.sharedQuerier.groups()
    }
    
    func groupForObjectId(groupIdInSearchOf: String) -> NSManagedObject? {
        let groups = self.groups() as NSArray
        for group in groups {
            if let groupId = group.valueForKey("objectId") as? NSString {
                if groupId.isEqualToString(groupIdInSearchOf) {
                    return group as? NSManagedObject
                }
            }
        }
        return nil
    }
    
    func deleteCurrentUser() -> Void {
        ZSSLocalStore.sharedQuerier.deleteUser()
    }
    
    func groupExists(#groupIdInSearchOf: NSString) -> Bool{
        let groups = self.groups() as NSArray
        for group in groups {
            if let groupId = group.valueForKey("objectId") as? NSString {
                if groupId.isEqualToString(groupIdInSearchOf) {
                    return true
                }
            }
        }
        return false
    }
    
}
