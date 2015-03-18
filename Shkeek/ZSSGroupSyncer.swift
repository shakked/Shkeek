//
//  ZSSGroupSyncer.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/16/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSGroupSyncer: NSObject {
    class var sharedQuerier: ZSSGroupSyncer {
        struct Static {
            static let instance: ZSSGroupSyncer = ZSSGroupSyncer()
        }
        return Static.instance
    }
    
    func syncGroups(cloudGroups: [PFObject], completion:((error: NSError?) -> Void)) {
        
    }
    
    private func getGroupIds() -> [NSString] {
     
        return []
    }
}
