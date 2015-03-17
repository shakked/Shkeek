//
//  ZSSLoginQuerier.swift
//  
//
//  Created by Zachary Shakked on 3/16/15.
//
//

import UIKit
import Parse

class ZSSLoginQuerier: NSObject {
    
    class var sharedQuerier: ZSSLoginQuerier {
        struct Static {
            static let instance: ZSSLoginQuerier = ZSSLoginQuerier()
        }
        return Static.instance
    }
    
    func logInUserThroughFacebookW(completion: ((user: PFUser?, error: NSError?) -> Void)) {
        let permissions = ["email"]

    }

    func logInUserThroughTwitter(completion: ((user: PFUser?, error: NSError?) -> Void)) {
        
    }
    
    func configureFacebookLinkedUser(completion:((user: PFUser, error: NSError?) -> Void)) {
        
    }
    
    func configureTwitterLinkedUser(completion:((user: PFUser, error: NSError?) -> Void)) {
        
    }

}
