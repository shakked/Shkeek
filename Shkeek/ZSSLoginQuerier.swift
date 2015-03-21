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
        let fbRequest = FBRequest.requestForMe()
        fbRequest.startWithCompletionHandler { (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            let userInfo : Dictionary<String, AnyObject> = result as Dictionary
            PFUser.currentUser().setValue(userInfo["first_name"], forKey: "firstName")
            PFUser.currentUser().setValue(userInfo["last_name"], forKey: "lastName")
            PFUser.currentUser().setValue(userInfo["email"], forKey: "email")
            PFUser.currentUser().saveInBackgroundWithBlock({ (succeeded: Bool, error: NSError?) -> Void in
                completion(succeeded: succeeded, error: error)
            })
        }
    }
    
    func configureTwitterLinkedUser(#userInfo: Dictionary<String, AnyObject>, completion:((succeeded: Bool, error: NSError?) -> Void)) {
        PFUser.currentUser().setValue(userInfo["firstName"], forKey: "firstName")
        PFUser.currentUser().setValue(userInfo["lastName"], forKey: "lastName")
        PFUser.currentUser().setValue(userInfo["email"], forKey: "email")
        PFUser.currentUser().saveInBackgroundWithBlock({ (succeeded: Bool, error: NSError?) -> Void in
            completion(succeeded: succeeded, error: error)
        })
    }

    func signUpAndConfigureEmailLinkedUser(#userInfo: Dictionary<String, AnyObject>, completion:((succeeded: Bool, error: NSError?) -> Void)) {
        
    }
}
