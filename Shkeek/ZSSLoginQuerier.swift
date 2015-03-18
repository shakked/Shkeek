//
//  ZSSLoginQuerier.swift
//  
//
//  Created by Zachary Shakked on 3/16/15.
//
//

import UIKit

class ZSSLoginQuerier: NSObject {
    
    class var sharedQuerier: ZSSLoginQuerier {
        struct Static {
            static let instance: ZSSLoginQuerier = ZSSLoginQuerier()
        }
        return Static.instance
    }
    
    func logInUserThroughFacebook(completion: ((user: PFUser?, error: NSError?) -> Void)) {
        let permissions = ["email"]
        PFFacebookUtils.logInWithPermissions(permissions, block: { (user: PFUser!, error: NSError!) -> Void in
            completion(user: user, error: error)
        })

    }

    func logInUserThroughTwitter(completion: ((user: PFUser?, error: NSError?) -> Void)) {
        PFTwitterUtils.logInWithBlock { (user: PFUser!, error: NSError!) -> Void in
            completion(user: user, error: error)
        }
    }
    
    func configureFacebookLinkedUser(completion:((succeeded: Bool, error: NSError?) -> Void)) {
        
    }
    
    func configureTwitterLinkedUser(completion:((succeeded: Bool, error: NSError?) -> Void)) {
        let displayName : String = PFUser.currentUser().valueForKey("authData")?.valueForKey("twitter")?.valueForKey("screen_name") as String
        PFUser.currentUser().setValue(displayName, forKey: "username")
        PFUser.currentUser().saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
            completion(succeeded: succeeded, error: error)
        }
    }

}
