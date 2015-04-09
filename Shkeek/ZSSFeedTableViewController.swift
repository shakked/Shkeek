//
//  ZSSFeedTableViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 4/8/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSFeedTableViewController: UITableViewController {

    var announcements : [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
    }
    
    func configureViews() -> Void {
        configureTableView()
        configureNavBar()
    }
    
    func configureTableView() -> Void {
        
    }
    
    func configureNavBar() -> Void {
        navigationItem.title = "Feed"
        if let font = UIFont(name: "Avenir-Black", size: 22) {
            self.navigationController?.navigationBar.titleTextAttributes =
                [NSFontAttributeName: font,
                    NSForegroundColorAttributeName: UIColor.whiteColor()]
        }
    }
    
    func configureNavBarButtons() -> Void {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        fetchAnnouncements()
    }
    
    func fetchAnnouncements() -> Void {
        ZSSAnnouncmentQuerier.sharedQuerier.fetchAnnouncements { (succeeded, announcements) -> Void in
            if let announcements = announcements {
                self.announcements = announcements
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.announcements.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        return cell
    }

    func configureCellForAnnouncement(cell: ZSSAnnouncementCell, announcement: PFObject) -> Void {
        cell.profileImageView.image = ZSSLocalQuerier.sharedQuerier.profilePicForGroupId(announcement.objectId)
        let group = announcement.valueForKey("group") as PFObject
        let groupName = group.valueForKey("name") as String
        cell.groupNameLabel.text = groupName
        
        let author = announcement.valueForKey("author") as PFUser
        let authorFirstName = author.valueForKey("firstName") as String
        let authorLastName = author.valueForKey("lastName") as String
        cell.authorNameLabel.text = "\(authorFirstName) \(authorLastName)"
        
        let time = announcement.createdAt
        let timeString = time.shortTimeAgoSinceNow()
        cell.timeLabel.text = timeString
        
        let title = announcement.valueForKey("title") as String
        cell.titleLabel.text = title
        
        if let body = announcement.valueForKey("body") as? String {
            cell.bodyLabel.text = body
        }
        
        cell.profileImageTappedBlock = {
            println("show group profile")
        }

    }

}
