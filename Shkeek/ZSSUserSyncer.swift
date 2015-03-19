//
//  ZSSUserSyncer.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/19/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData

class ZSSUserSyncer: NSObject {
   
    class var sharedQuerier: ZSSUserSyncer {
        struct Static {
            static let instance: ZSSUserSyncer = ZSSUserSyncer()
        }
        return Static.instance
    }
    
    
    func syncLocalUserToCloudUser() -> Void {
        let cloudUser : PFUser = PFUser.currentUser()
        let localUser : NSManagedObject = ZSSLocalQuerier.sharedQuerier.currentUser()
        localUser.setValue(cloudUser.valueForKey("username"), forKey: "username")
        localUser.setValue(cloudUser.valueForKey("reportedCount"), forKey: "reportedCount")
        localUser.setValue(cloudUser.objectId, forKey: "objectId")
        localUser.setValue(cloudUser.valueForKey("isEmailConfirmed"), forKey: "isEmailConfirmed")
        localUser.setValue(cloudUser.valueForKey("isBanned"), forKey: "isBanned")
        localUser.setValue(cloudUser.valueForKey("email"), forKey: "email")
        localUser.setValue(cloudUser.valueForKey("didFillOutUserInfoForm"), forKey: "didFillOutUserInfoForm")
        localUser.setValue(cloudUser.valueForKey("didAgreeToEULA"), forKey: "didAgreeToEULA")
        localUser.setValue(cloudUser.valueForKey("authType"), forKey: "authType")
        ZSSLocalStore.sharedQuerier.saveCoreDataChanges()
    }
}
