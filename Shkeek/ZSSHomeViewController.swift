//
//  ZSSHomeViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/21/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override init() {
        super.init(nibName: "ZSSHomeViewController", bundle: NSBundle.mainBundle())
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func printUserInfo(sender: AnyObject) {
        println(ZSSLocalQuerier.sharedQuerier.currentUser())
    }

    @IBAction func logOut(sender: AnyObject) {
        PFUser.logOut()
        let lvc = ZSSLoginViewController()
        ZSSLocalQuerier.sharedQuerier.deleteCurrentUser()
        ZSSLocalStore.sharedQuerier.saveCoreDataChanges()
        presentViewController(lvc, animated: true, completion: nil)
    }
    
    @IBAction func showCreateGroup(sender: AnyObject) {
        let gctvc = ZSSGroupCreateTableViewController()
        let nav = UINavigationController(rootViewController: gctvc)
        presentViewController(nav, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
