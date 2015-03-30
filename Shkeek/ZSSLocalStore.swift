//
//  ZSSLocalStore.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//
import UIKit
import CoreData


public class ZSSLocalStore: NSObject {
    
    public var context : NSManagedObjectContext!
    
    public var privateUser : NSManagedObject?
    private var privateGroups : [NSManagedObject]?
    
    public class var sharedQuerier: ZSSLocalStore {
        struct Static {
            static let instance: ZSSLocalStore = ZSSLocalStore()
        }
        return Static.instance
    }
    
    override init() {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        context = appDelegate.managedObjectContext
        super.init()
        configureCoreData()
    }
    
    public func user() -> NSManagedObject? {
        return privateUser
    }
    
    public func groups() -> [NSManagedObject]! {
        if (privateGroups == nil) {
            return []
        } else {
            return privateGroups
        }
    }
    
    public func createGroup() -> NSManagedObject {
        
        var group : NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("ZSSGroup", inManagedObjectContext: context) as NSManagedObject
        privateGroups!.append(group)
        return group
    }
    
    public func fetchGroupWithObjectId(#objectId: String) -> NSManagedObject? {
        if let groups = privateGroups {
            for group in groups {
                if group.valueForKey("objectId")!.isEqual(objectId) {
                    return group
                }
            }
        }
        return nil
    }
    
    public func deleteGroup(#group: NSManagedObject) -> Void {
        context.deleteObject(group)
        privateGroups!.removeObject(group)
        
    }
    
    public func createUser() -> NSManagedObject? {
        if !userExists() {
            var user : NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("ZSSUser", inManagedObjectContext: context) as NSManagedObject
            privateUser = user
            return user
        } else {
            let userAlreadyExistsException = NSException(name: "UserAlreadyExistsException", reason: "A user has already been created for the current session. To create another user, the current one must first be deleted or signed out.", userInfo: nil)
            userAlreadyExistsException.raise()
        }
        return nil
    }
    
    public func deleteUser() -> Void {
        if let user = privateUser {
            context.deleteObject(user)
            privateUser = nil
        }
    }
    
    public func userExists() -> Bool {
        if let user = privateUser {
            return true
        } else {
            return false
        }
    }
    
    public func deleteAllObjects() -> Void {
        
        for group in privateGroups! {
            context.deleteObject(group)
            privateGroups?.removeObject(group)
        }
        
        if let user = privateUser {
            context.deleteObject(user)
            privateUser = nil
        }
    }
    
    func saveCoreDataChanges() -> Void {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.saveContext()
        
    }
    
    private func configureCoreData() -> Void {
        if privateUser == nil {
            var userFetch : NSFetchRequest = NSFetchRequest(entityName: "ZSSUser")
            let results : [AnyObject]? = context.executeFetchRequest(userFetch, error: nil)
            if let results = results {
                if results.count >= 1 {
                    privateUser = (results[0] as NSManagedObject)
                } else {
                    privateUser = nil
                }
            }
        }
        
        if privateGroups == nil {
            var groupsFetch : NSFetchRequest = NSFetchRequest(entityName: "ZSSGroup")
            let results : [AnyObject]? = context.executeFetchRequest(groupsFetch, error: nil)
            if let results = results {
                if results.count >= 1 {
                    privateGroups = (results as [NSManagedObject])
                } else {
                    privateGroups = []
                }
            }
        }
    }
    
    
}
