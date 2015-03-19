//
//  ZSSLoginViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/18/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init(nibName: "ZSSLoginViewController", bundle: NSBundle.mainBundle())
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var loginWithFacebookButton: UIButton!
    @IBOutlet weak var loginWithTwitterButton: UIButton!
    @IBOutlet weak var loginWithEmailButton: UIButton!

    
    
    @IBAction func loginWithFacebookButtonPressed(sender: AnyObject) {
        ZSSLoginQuerier.sharedQuerier.logInUserThroughFacebook { (user, error) -> Void in
            if let user = user? {
                user.setValue("facebook", forKey: "authType")
                user.saveInBackgroundWithTarget(nil, selector: nil)
                ZSSUserSyncer.sharedQuerier.syncLocalUserToCloudUser()
                
                if (self.shouldShowForm()) {
                    ZSSLoginQuerier.sharedQuerier.configureFacebookLinkedUser({ (succeeded: Bool, error: NSError?) -> Void in
                        if succeeded {
                            self.showEULA()
                        } else {
                            //SHOW ERROR
                        }
                    })
                } else if (self.shouldShowEULA()) {
                    self.showEULA()
                } else {
                    self.showHome()
                }
            }
            //TODO: If login is unsuccessful
        }
    }

    @IBAction func loginWithTwitterButtonPressed(sender: AnyObject) {
        ZSSLoginQuerier.sharedQuerier.logInUserThroughTwitter { (user: PFUser?, error   : NSError?) -> Void in
            if let user = user? {
                user.setValue("twitter", forKey: "authType")
                user.saveInBackgroundWithTarget(nil, selector: nil)
                ZSSUserSyncer.sharedQuerier.syncLocalUserToCloudUser()
                
                if (self.shouldShowForm()) {
                    self.showTwitterForm()
                } else if (self.shouldShowEULA()) {
                    self.showEULA()
                } else {
                    self.showHome()
                }
            }
            //TODO: If login is unsuccessful
        }
    }
    
    @IBAction func loginWithEmailButtonPressed(sender: AnyObject) {
        let eltvc = EmailLoginTableViewController()
        let nav = UINavigationController(rootViewController: eltvc)
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    func shouldShowHome() -> Bool {
        if ZSSLocalQuerier.sharedQuerier.userDidFillOutUserInfoForm() {
            return true
        } else {
            return false
        }
    }
    
    func shouldShowForm() -> Bool {
        let localUser = ZSSLocalQuerier.sharedQuerier.currentUser()
        println(localUser)
            if let didFillOutForm = (localUser.valueForKey("didFillOutUserInfoForm") as? NSNumber)?.boolValue{
            if didFillOutForm {
                println("shouldNOTShowForm")
                return false
            } else {
                println("shouldShowForm")
                return true
            }
        }
        println("shouldShowForm")
        return true
    }
    
    func shouldShowEULA() -> Bool {
        let localUser = ZSSLocalQuerier.sharedQuerier.currentUser()
        if let didAgreeToEULA = (localUser.valueForKey("didAgreeToEULA") as? NSNumber)?.boolValue {
            if didAgreeToEULA {
                println("shouldNOTShowEULA")
                return false
            } else {
                println("shouldShowEULA")
                return true
            }
        }
        println("shouldShowEULA")
        return true
    }
    
    
    func showTwitterForm() -> Void {
        println("showing twitterForm")
        let tsvc = TwitterSignUpTableViewController()
        let nav = UINavigationController(rootViewController: tsvc)
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    func showEULA() -> Void {
        println("showing eula")
    }
    
    func showHome() -> Void {
        println("showing home")
    }
}
