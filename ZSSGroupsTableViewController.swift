//
//  ZSSGroupsTableViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/30/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData

class ZSSGroupsTableViewController: UITableViewController {
    
    var groups : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        tableView.registerNib(UINib(nibName: "ZSSGroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        syncAndLoadGroups()
    }
    
    func configureViews() -> Void {
        configureNavBar()
    }
    
    func configureNavBar() -> Void {
        configureNavBarButtons()
        navigationItem.title = "Groups"
    }
    
    func configureNavBarButtons() -> Void {
        let createGroupBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("showCreateGroupView"))
        navigationItem.rightBarButtonItem = createGroupBarButton
    }
    
    func syncAndLoadGroups() -> Void {
        ZSSGroupSyncer.sharedQuerier.syncGroups { (succeeded: Bool) -> Void in
            if succeeded {
                self.groups = ZSSLocalQuerier.sharedQuerier.groups()
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("groupCell") as? ZSSGroupCell
        
        let group = self.groups[indexPath.row]
        cell?.groupNameLabel.text = group.valueForKey("name") as? String
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func showCreateGroupView() -> Void {
        let gctv = ZSSGroupCreateTableViewController()
        let nav = UINavigationController(rootViewController: gctv)
        presentViewController(nav, animated: true, completion: nil)
    }
    

}
