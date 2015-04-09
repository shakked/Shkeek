import UIKit
import CoreData

class ZSSAnnouncmentQuerier: NSObject {
    class var sharedQuerier: ZSSAnnouncmentQuerier {
        struct Static {
            static let instance: ZSSAnnouncmentQuerier = ZSSAnnouncmentQuerier()
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