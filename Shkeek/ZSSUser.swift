//
//  ZSSUser.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import Foundation
import CoreData

class ZSSUser: NSManagedObject {

    @NSManaged var objectId: String
    @NSManaged var email: String
    @NSManaged var isEmailConfirmed: NSNumber
    @NSManaged var profilePicture: AnyObject
    @NSManaged var isBanned: NSNumber
    @NSManaged var reportedCount: NSNumber
    @NSManaged var adminsOf: NSSet

}
