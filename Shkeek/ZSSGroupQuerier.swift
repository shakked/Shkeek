//
//  ZSSGroupQuerier.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData
import Parse

class ZSSGroupQuerier: NSObject {
    
    class var sharedQuerier: ZSSGroupQuerier {
        struct Static {
            static let instance: ZSSGroupQuerier = ZSSGroupQuerier()
        }
        return Static.instance
    }
    
    func findCurrentUserGroups(completion: ((error: NSError?, groups:[NSManagedObject]) -> Void)) {
        completion(error: nil, groups: [])
    }
    
    func saveLocalGroup(localGroup: NSManagedObject, completion: ((error: NSError?, succeeded: Bool) -> Void)) {
        
        //AFNetworking PUT (save network calls)
        completion(error: nil, succeeded: true)
    }
    
    func fetchGroups(completion: ((groups: [PFObject]?, succeeded: Bool) -> Void)) {
        let groupQuery = PFQuery(className: "ZSSGroup")
        groupQuery.whereKey("followers", equalTo: PFUser.currentUser())
        groupQuery.limit = 1000
        
        
        groupQuery.findObjectsInBackgroundWithBlock { (groups:[AnyObject]!, error:NSError?) -> Void in
            if let error = error {
                completion(groups: nil, succeeded: false)
            }
            let groups = groups as [PFObject]
            completion(groups: groups, succeeded: true)
            
        }
    }
    
    func createGroup(#groupInfo: [String: AnyObject], completion: (error: NSError?, succeeded: Bool) -> Void) {
        let name = groupInfo["name"] as String
        let category = groupInfo["category"] as String
        let groupDescription = groupInfo["groupDescription"] as String
        let choices = groupInfo["choices"] as [String : Bool]
        let isPublic = choices["isPublic"] as Bool?
        let isPrivate = choices["isPrivate"] as Bool?
        let isHidden = choices["isHidden"] as Bool?
        
        let newGroup = PFObject(className: "ZSSGroup")
        newGroup.setValue(name, forKey: "name")
        newGroup.setValue(category, forKey: "category")
        newGroup.setValue(groupDescription, forKey: "groupDescription")
        newGroup.setValue(isPublic, forKey: "isPublic")
        newGroup.setValue(isPrivate, forKey: "isPrivate")
        newGroup.setValue(isHidden, forKey: "isHidden")
        newGroup.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError?) -> Void in
            if succeeded {
                ZSSLocalQuerier.sharedQuerier.createGroup(groupInfo: groupInfo)
            }
            completion(error: error, succeeded: succeeded)
        }
    }
    
    
}
