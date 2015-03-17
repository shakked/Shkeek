//
//  ZSSLocalFactory.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSLocalFactory: NSObject {
    
    func createGroup() -> ZSSGroup? {
        return nil
    }
    
    func createUser() -> ZSSUser? {
        //watch out for multiple users, logging out should delete user
        return nil
    }
    
}

