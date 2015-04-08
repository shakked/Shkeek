//
//  ZSSAnnouncmentQuerier.swift
//  Shkeek
//
//  Created by Zachary Shakked on 4/8/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData

class ZSSAnnouncmentQuerier: NSObject {
    class var sharedQuerier: ZSSAnnouncementQuerier {
        struct Static {
            static let instance: ZSSAnnouncementQuerier = ZSSAnnouncementQuerier()
        }
        return Static.instance
    }
    
    func fetchAnnouncements(completion: ((succeeded: Bool, announcements:[PFObject]?) -> Void)) {
        ZSSGroupQuerier.sharedQuerier.fetchGroups { (groups: [PFObject]?, succeeded: Bool) -> Void in
            if let groups = groups {
                let announcementQuery = PFQuery(className: "ZSSAnnouncement")
                announcementQuery.whereKey("group", containedIn: groups)
                announcementQuery.findObjectsInBackgroundWithBlock({ (announcements: [AnyObject]!, error: NSError!) -> Void in
                    if let announcements = announcements as? [PFObject] {
                        completion(succeeded: true, announcements: announcements)
                    }
                })
            }
            completion(succeeded: false, announcements: nil)
        }
    }
}
