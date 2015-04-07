//
//  ZSSGroupAdminTableViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 4/3/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit
import CoreData
class ZSSGroupAdminTableViewController: UITableViewController {

    var group : NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews() -> Void {
        configureTableView()
        configureNavBar()
    }
    
    func configureTableView() -> Void {
        tableView.registerNib(UINib(nibName: "ZSSTextViewCell", bundle: nil), forCellReuseIdentifier: "textViewCell")
        tableView.registerNib(UINib(nibName: "ZSSLabelCell", bundle: nil), forCellReuseIdentifier: "labelCell")
        tableView.backgroundColor? = UIColor.cloudColor()
    }
    
    func configureNavBar() -> Void {
        navigationItem.title = group.valueForKey("name") as? String
        configureNavBarButtons()
    }
    
    func configureNavBarButtons() -> Void {
        let newAnnouncementBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("newAnnouncementPressed"))
        navigationItem.rightBarButtonItem = newAnnouncementBarButton
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("labelCell") as ZSSLabelCell
            cell.itemLabel.text = group.valueForKey("name") as? String
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("labelCell") as ZSSLabelCell
            cell.itemLabel.text = group.valueForKey("category") as? String
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as ZSSTextViewCell
            cell.textView.text = group.valueForKey("groupDescription") as? String
            cell.textView.editable = false 
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("labelCell") as ZSSLabelCell
            let isPublic = group.valueForKey("isPublic")? as NSNumber
            cell.itemLabel.text = "isPublic : \(isPublic)"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("labelCell") as ZSSLabelCell
            let isPrivate = group.valueForKey("isPrivate")? as NSNumber
            cell.itemLabel.text = "isPrivate : \(isPrivate)"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCellWithIdentifier("labelCell") as ZSSLabelCell
            let isHidden = group.valueForKey("isHidden")? as NSNumber
            cell.itemLabel.text = "isHidden : \(isHidden)"
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("labelCell") as ZSSLabelCell
            cell.itemLabel.text = "No cell found"
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0,1,3,4,5:
            return 50
        case 2:
            return 200
        default:
            return 100
        }
    }
    
    func newAnnouncementPressed() -> Void {
        
    }


}
