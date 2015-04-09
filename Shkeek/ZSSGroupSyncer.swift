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
    
    func shouldUpdate(cloudGroup: PFObject) -> Bool {
        let cloudUpdatedAt = cloudGroup.valueForKey("updatedAt") as NSDate
        let localGroup = ZSSLocalQuerier.sharedQuerier.groupForObjectId(cloudGroup.objectId)
        let localUpdatedAt = localGroup?.valueForKey("updatedAt") as? NSDate
        if let localUpdatedAt = localUpdatedAt {
            if cloudUpdatedAt.isEqualToDate(localUpdatedAt) {
                return false
            }
        }
        return true
    }
    
    func updateGroupLocally(cloudGroup: PFObject) -> Void {
        let shouldUpdateGroup = shouldUpdate(cloudGroup)
        if shouldUpdateGroup {
            let groupExistsLocally = ZSSLocalQuerier.sharedQuerier.groupExists(groupIdInSearchOf: cloudGroup.objectId)
            if groupExistsLocally {
                syncLocalGroupForCloudGroup(cloudGroup)
            } else {
                let newGroup = ZSSLocalFactory.sharedFactory.createGroup()
                syncLocalGroupForCloudGroup(cloudGroup)
            }
        }
    }
    
    private func syncLocalGroupForCloudGroup(cloudGroup: PFObject) -> Void {
        if let localGroup = ZSSLocalQuerier.sharedQuerier.groupForObjectId(cloudGroup.objectId) {
            localGroup.setValue(cloudGroup.valueForKey("announcementsLeft"), forKey: "announcementsLeft")
            localGroup.setValue(cloudGroup.valueForKey("category"), forKey: "category")
            localGroup.setValue(cloudGroup.valueForKey("code"), forKey: "code")
            localGroup.setValue(cloudGroup.valueForKey("dateOfLastAnnouncement"), forKey: "dateOfLastAnnouncement")
            localGroup.setValue(cloudGroup.valueForKey("followerCount"), forKey: "followerCount")
            localGroup.setValue(cloudGroup.valueForKey("groupDescription"), forKey: "groupDescription")
            localGroup.setValue(cloudGroup.valueForKey("isBanned"), forKey: "isBanned")
            localGroup.setValue(cloudGroup.valueForKey("isHidden"), forKey: "isHidden")
            localGroup.setValue(cloudGroup.valueForKey("isPremium"), forKey: "isPremium")
            localGroup.setValue(cloudGroup.valueForKey("isPrivate"), forKey: "isPrivate")
            localGroup.setValue(cloudGroup.valueForKey("isPublic"), forKey: "isPublic")
            localGroup.setValue(cloudGroup.valueForKey("name"), forKey: "name")
            
            let profileImageFile = cloudGroup.valueForKey("profilePicture") as PFFile
            //TODO: TRY INCLUDE HERE->
            profileImageFile.getDataInBackgroundWithBlock({ (data: NSData!, error: NSError?) -> Void in
                if let data = data {
                    let profileImage = UIImage(data: data)!
                    localGroup.setValue(profileImage, forKey: "profilePicture")
                }
            })
            
        }
    }
    
    private func syncAdminStatusForGroups(completion:((succeeded: Bool) -> Void)) {
        let adminGroupQuery = PFQuery(className: "ZSSGroup")
        adminGroupQuery.whereKey("admins", equalTo: PFUser.currentUser())
        adminGroupQuery.findObjectsInBackgroundWithBlock { (groups: [AnyObject]!, error: NSError?) -> Void in
            
        }
    }
    
    
    
    
}
