//
//  ZSSGroupCreateTableViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/21/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSGroupCreateTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    func configureViews() -> Void {
        configureTableView()
        configureNavBar()
    }
    
    func configureTableView() -> Void {
        tableView.registerNib(UINib(nibName: "ZSSTextFieldCell", bundle: nil), forCellReuseIdentifier: "fieldCell")
        tableView.registerNib(UINib(nibName: "ZSSProfilePicCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        tableView.registerNib(UINib(nibName: "ZSSChoiceCell", bundle: nil), forCellReuseIdentifier: "choiceCell")
        tableView.backgroundColor? = UIColor.cloudColor()
    }
    
    func configureNavBar() -> Void {
        navigationItem.title = "Sign Up"
        configureNavBarButtons()
    }
    
    func configureNavBarButtons() -> Void {
        let cancelBarButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: Selector("cancel"))
        let saveBarButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("done"))
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = saveBarButton
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 6
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell : ZSSProfilePicCell = tableView.dequeueReusableCellWithIdentifier("profileCell") as ZSSProfilePicCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        } else {
            let cell : ZSSTextFieldCell = tableView.dequeueReusableCellWithIdentifier("fieldCell", forIndexPath: indexPath) as ZSSTextFieldCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            switch indexPath.row{
            case 1:
                cell.fieldLabel?.text = "Group Name"
            case 2:
                cell.fieldLabel?.text = "Category"
            case 3:
                cell.fieldLabel?.text = "Group Description"
            default:
                break
            }
            
            return cell
        }
    }
    
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 170.0
        } else {
            return 40.0
        }
    }
}
