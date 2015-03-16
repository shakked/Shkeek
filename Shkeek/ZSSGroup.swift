//
//  ZSSGroup.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import Foundation
import CoreData

class ZSSGroup: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var code: String
    @NSManaged var profilePicture: AnyObject
    @NSManaged var followerCount: NSNumber
    @NSManaged var isPublic: NSNumber
    @NSManaged var isPrivate: NSNumber
    @NSManaged var isHidden: NSNumber
    @NSManaged var isBanned: NSNumber
    @NSManaged var admins: NSSet

}
