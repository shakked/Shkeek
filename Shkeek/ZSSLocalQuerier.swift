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
    
    func createGroup(#groupInfo: [String: AnyObject]) {
        let name = groupInfo["name"] as String
        let category = groupInfo["category"] as String
        let groupDescription = groupInfo["groupDescription"] as String
        let choices = groupInfo["choices"] as [String : Bool]
        let isPublic = choices["isPublic"] as Bool?
        let isPrivate = choices["isPrivate"] as Bool?
        let isHidden = choices["isHidden"] as Bool?
        
        let newGroup : NSManagedObject = ZSSLocalFactory.sharedFactory.createGroup()
        newGroup.setValue(name, forKey: "name")
        newGroup.setValue(category, forKey: "category")
        newGroup.setValue(groupDescription, forKey: "groupDescription")
        newGroup.setValue(isPublic, forKey: "isPublic")
        newGroup.setValue(isPrivate, forKey: "isPrivate")
        newGroup.setValue(isHidden, forKey: "isHidden")
        ZSSLocalStore.sharedQuerier.saveCoreDataChanges()
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
