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
            } else {
                let localGroupIds = self.getLocalGroupIds()
                let cloudGroupIds = self.getCloudGroupIds(cloudGroups: groups!)
                
            }
            
        }
    }
    
    private func getLocalGroupIds() -> [String] {
        let localGroups = ZSSLocalQuerier.sharedQuerier.groups();
        var localGroupsIds : [String] = []
        for group in localGroups {
            let groupId = group.valueForKey("objectId") as String
            localGroupsIds.append(groupId)
        }
        return localGroupsIds
    }
    
    private func getCloudGroupIds(#cloudGroups: [PFObject]) -> [String] {
        var cloudGroupIds : [String] = []
        for group in cloudGroups {
            let groupId = group.objectId
            cloudGroupIds.append(groupId)
        }
        return cloudGroupIds
    }
    
    private func localGroupForCloudUser(cloudUser: [PFObject]) ->  {
        //YOU WERE FINISHING IMPLEMENTING THE GROUP SYNC
    }
    
    
    
    
}
