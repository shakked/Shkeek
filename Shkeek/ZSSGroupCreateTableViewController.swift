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
        configureViews()
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
        tableView.registerNib(UINib(nibName: "ZSSTextViewCell", bundle: nil), forCellReuseIdentifier: "textViewCell")
        tableView.registerNib(UINib(nibName: "ZSSChoiceCell", bundle: nil), forCellReuseIdentifier: "choiceCell")
        tableView.backgroundColor? = UIColor.cloudColor()
    }
    
    func configureNavBar() -> Void {
        navigationItem.title = "Create a Group"
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
        return 5
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row{
            case 0:
                let cell : ZSSProfilePicCell = tableView.dequeueReusableCellWithIdentifier("profileCell") as ZSSProfilePicCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                return cell
            case 1:
                let cell : ZSSTextFieldCell = tableView.dequeueReusableCellWithIdentifier("fieldCell") as ZSSTextFieldCell
                cell.fieldLabel.text = "Group Name"
                return cell
            case 2:
                let cell : ZSSTextFieldCell = tableView.dequeueReusableCellWithIdentifier("fieldCell") as ZSSTextFieldCell
                cell.fieldLabel.text = "Category"
                return cell
            case 3:
                let cell : ZSSChoiceCell = tableView.dequeueReusableCellWithIdentifier("choiceCell") as ZSSChoiceCell
                cell.choice1button.setTitle("Public", forState: UIControlState.Normal)
                cell.choice1buttonPressedBlock = { (Void) -> Void in
                    println("choice1pressed")
                }
                cell.imageView1.backgroundColor = UIColor.blueColor()
                cell.imageView1.layer.cornerRadius = 10.0
                cell.imageView1.layer.masksToBounds = true
                
                cell.choice2button.setTitle("Private", forState: UIControlState.Normal)
                cell.choice2buttonPressedBlock = { (Void) -> Void in
                    println("choice2pressed")
                }
                cell.imageView2.backgroundColor = UIColor.blueColor()
                cell.imageView2.layer.cornerRadius = 10.0
                cell.imageView2.layer.masksToBounds = true
                
                cell.choice3button.setTitle("Hidden", forState: UIControlState.Normal)
                cell.choice3buttonPressedBlock = { (Void) -> Void in
                    println("choice3pressed")
                }
                cell.imageView3.backgroundColor = UIColor.blueColor()
                cell.imageView3.layer.cornerRadius = 10.0
                cell.imageView3.layer.masksToBounds = true
            
                return cell
            case 4:
                let cell : ZSSTextViewCell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as ZSSTextViewCell
                cell.titleLabel.text = "Group Description"
                cell.textView.text = ""
                return cell
            default:
                break
        }
        return UITableViewCell()
    }
    
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 170
        case 1, 2, 3:
            return 40
        case 4:
            return 200
        default:
            return 50
        }
    }
    
    func done() -> Void {
        println("done...")
    }
    
    func cancel() -> Void {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
