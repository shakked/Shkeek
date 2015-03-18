//
//  ZSSGroupQuerier.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData

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

    
    
    
    
    
}
