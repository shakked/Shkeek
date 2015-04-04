//
//  ZSSGroupSyncer.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData

class ZSSGroupSyncer: NSObject {
    class var sharedQuerier: ZSSGroupSyncer {
        struct Static {
            static let instance: ZSSGroupSyncer = ZSSGroupSyncer()
        }
        return Static.instance
    }
    
    func syncGroups(completion:((succeeded: Bool) -> Void)) {
        ZSSGroupQuerier.sharedQuerier.fetchGroups { (groups: [PFObject]?, succeeded: Bool) -> Void in
            if !succeeded {
                completion(succeeded: false)
                return
            }
            for group in groups! {
                self.updateGroupLocally(group)
            }
            completion(succeeded: succeeded)
        }
    }
    
    private func updateGroupLocally(cloudGroup: PFObject) -> Void {
        let groupExistsLocally = ZSSLocalQuerier.sharedQuerier.groupExists(groupIdInSearchOf: cloudGroup.objectId)
        if groupExistsLocally {
            syncLocalGroupForCloudGroup(cloudGroup)
        } else {
            let newGroup = ZSSLocalFactory.sharedFactory.createGroup()
            syncLocalGroupForCloudGroup(cloudGroup)
        }
    }
    
    private func syncLocalGroupForCloudGroup(cloudGroup: PFObject) -> Void {
        if let localGroup = ZSSLocalQuerier.sharedQuerier.groupForObjectId(cloudGroup.objectId) {
            localGroup.setValue(cloudGroup.valueForKey("category"), forKey: "category")
            localGroup.setValue(cloudGroup.valueForKey("code"), forKey: "code")
            localGroup.setValue(cloudGroup.valueForKey("followerCount"), forKey: "followerCount")
            localGroup.setValue(cloudGroup.valueForKey("groupDescription"), forKey: "groupDescription")
            localGroup.setValue(cloudGroup.valueForKey("isBanned"), forKey: "isBanned")
            localGroup.setValue(cloudGroup.valueForKey("isHidden"), forKey: "isHidden")
            localGroup.setValue(cloudGroup.valueForKey("isPremium"), forKey: "isPremium")
            localGroup.setValue(cloudGroup.valueForKey("isPrivate"), forKey: "isPrivate")
            localGroup.setValue(cloudGroup.valueForKey("isPublic"), forKey: "isPublic")
            localGroup.setValue(cloudGroup.valueForKey("name"), forKey: "name")
        }
    }
    
    private func syncAdminStatusForGroups(completion:((succeeded: Bool) -> Void)) {
        let adminGroupQuery = PFQuery(className: "ZSSGroup")
        adminGroupQuery.whereKey("admins", equalTo: PFUser.currentUser())
        adminGroupQuery.findObjectsInBackgroundWithBlock { (groups: [AnyObject]!, error: NSError?) -> Void in
            
        }
    }
    
    
    
    
}
