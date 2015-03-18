//
//  ZSSLocalFactory.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData

class ZSSLocalFactory: NSObject {
    
    func createUser() -> NSManagedObject? {
        return ZSSLocalStore.sharedQuerier.createUser()
    }
    
    func createGroup() -> NSManagedObject? {
        return ZSSLocalStore.sharedQuerier.createGroup()
    }
    
}

