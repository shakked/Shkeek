//
//  ZSSLocalStore.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//
import UIKit
import CoreData

class ZSSLocalStore: NSObject {
    
    private var context : NSManagedObjectContext!
    private var model : NSManagedObjectModel!
    var privateUser : ZSSUser?
    private var privateGroups : [ZSSGroup]?
    
    class var sharedQuerier: ZSSLocalStore {
        struct Static {
            static let instance: ZSSLocalStore = ZSSLocalStore()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        configureCoreData()
    }
    
    func user() -> ZSSUser? {
        return privateUser
    }
    
    func groups() -> [ZSSGroup]? {
        if (privateGroups == nil) {
            return []
        } else {
            return privateGroups
        }
    }
    
    func createGroup() -> ZSSGroup? {
        var group : ZSSGroup = NSEntityDescription.insertNewObjectForEntityForName("ZSSGroup", inManagedObjectContext: context) as ZSSGroup
        privateGroups!.append(group)
        return group
    }
    
    func fetchGroupWithObjectId(#objectId: String) -> ZSSGroup? {
        if let groups = privateGroups {
            for group in groups {
                if group.objectId == objectId {
                    return group
                }
            }
        }
        return nil
    }
    
    func deleteGroup(#group: ZSSGroup) -> Bool {
        context.deleteObject(group)
        return saveCoreDataChanges()
    }
    
    func createUser() -> ZSSUser? {
        if !userExists() {
            var user : ZSSUser = NSEntityDescription.insertNewObjectForEntityForName("ZSSUser", inManagedObjectContext: context) as ZSSUser
            privateUser = user
            return user
        } else {
            let userAlreadyExistsException = NSException(name: "UserAlreadyExistsException", reason: "A user has already been created for the current session. To create another user, the current one must first be deleted or signed out.", userInfo: nil)
            userAlreadyExistsException.raise()
        }
        return nil
    }
    
    func deleteUser() -> Bool {
        if let user = privateUser {
            context.deleteObject(user)
        }
        return saveCoreDataChanges()
    }
    
    func userExists() -> Bool {
        if let user = privateUser {
            return true
        } else {
            return false
        }
    }
    
    func deleteAllObjects() -> Void {
        for group in privateGroups! {
            context.deleteObject(group)
        }
        
        if let user = privateUser {
            context.deleteObject(user)
        }
    }
    
    func saveCoreDataChanges() -> Bool {
        var error : NSError?
        let successful = context.save(&error)
        if (!successful) {
            println("Error saving \(error!.localizedDescription)")
        }
        return successful
    }
    
    private func configureCoreData() -> Void {
        model = NSManagedObjectModel.mergedModelFromBundles(nil)
        let psc : NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: model)
        let path = itemArchivePath()
        let storeURL = NSURL.fileURLWithPath(path)!
        var error : NSError?
        context = NSManagedObjectContext()
        context?.persistentStoreCoordinator = psc
        
        let options = [NSMigratePersistentStoresAutomaticallyOption : true,
            NSInferMappingModelAutomaticallyOption : true]
        
        var successOfAdding : Bool = psc?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options, error: &error) != nil
        
        if (!successOfAdding) {
            let fileExistsAtLocation = NSFileManager.defaultManager().fileExistsAtPath(storeURL.path!)
            if (fileExistsAtLocation) {
                
                NSFileManager.defaultManager().removeItemAtURL(storeURL, error: nil)
                successOfAdding = psc?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: &error) != nil
                
                if (!successOfAdding) {
                    println("Unresolved error.")
                    abort()
                }
            }
        }
        loadAllItems()
    }
    
    private func itemArchivePath() -> String {
        let documentDirectories = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = documentDirectories[0] as String
        return documentDirectory.stringByAppendingString("store.data")
    }
    
    private func loadAllItems() -> Void {
        if (privateUser == nil) {
            let request = NSFetchRequest()
            let e = NSEntityDescription.entityForName("ZSSUser", inManagedObjectContext: context)
            request.entity = e
            
            var error : NSError?
            let results : [ZSSUser]? = context.executeFetchRequest(request, error: &error) as [ZSSUser]?
            if (results == nil) {
                NSException.raise("Fetch failed", format:"Error: %@", arguments:getVaList([error!]))
            }
            privateUser = results![0]
        }
        
        if (privateGroups == nil) {
            let request = NSFetchRequest()
            let e = NSEntityDescription.entityForName("ZSSGroup", inManagedObjectContext: context)
            request.entity = e
            
            var error : NSError?
            let results : [ZSSGroup]? = context.executeFetchRequest(request, error: &error) as [ZSSGroup]?
            if (results == nil) {
                NSException.raise("Fetch failed", format:"Error: %@", arguments:getVaList([error!]))
            }
            privateGroups = results!
        }
        
    }
    
    
}
