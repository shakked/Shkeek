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
            println(user)
            println(error)
        }
    }

    @IBAction func loginWithTwitterButtonPressed(sender: AnyObject) {
        ZSSLoginQuerier.sharedQuerier.logInUserThroughTwitter { (user, error) -> Void in
            println(user)
            println(error)
        }
    }
    
    @IBAction func loginWithEmailButtonPressed(sender: AnyObject) {
        
    }
}
