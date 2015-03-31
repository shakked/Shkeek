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
            
                cell.choice2button.setTitle("Private", forState: UIControlState.Normal)
                
                cell.choice3button.setTitle("Hidden", forState: UIControlState.Normal)
              
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
        if (areFieldsValid()) {
            
        }
    }
    
    func areFieldsValid() -> Bool {
        let groupName = getGroupName()
        let category = getCategory()
        let choices = getChoices()
        let isPublic = choices["isPublic"]
        let isPrivate = choices["isPrivate"]
        let isHidden = choices["isHidden"]
        let groupDescription = getGroupDescription()
        
        var areValid = true
        
        if (groupName.utf16Count <= 0) {
            areValid = false
            getGroupNameCell().backgroundColor = UIColor.errorColor()
        }
        if (category.utf16Count <= 0) {
            areValid = false
            getGroupNameCell().backgroundColor = UIColor.errorColor()
        }
        
        if (isPublic? == nil && isPrivate == nil && isHidden == nil) {
            areValid = false;
            getChoiceCell().backgroundColor = UIColor.errorColor()
        }
        
        if (groupDescription.utf16Count <= 0) {
            areValid = false
            getGroupDescriptionCell().backgroundColor = UIColor.errorColor()
        }
        return areValid
    }
    

    func getGroupNameCell() -> ZSSTextFieldCell {
        let groupNameIndexPath = NSIndexPath(forRow: 1, inSection: 0)
        return tableView.cellForRowAtIndexPath(groupNameIndexPath) as ZSSTextFieldCell
    }
    
    func getGroupName() -> String {
        return getGroupNameCell().textField.text
    }
    
    func getCategoryCell() -> ZSSTextFieldCell {
        let categoryIndexPath = NSIndexPath(forRow: 2, inSection: 0)
        return tableView.cellForRowAtIndexPath(categoryIndexPath) as ZSSTextFieldCell
    }
    
    func getCategory() -> String {
        return getCategoryCell().textField.text
    }
    
    func getChoiceCell() -> ZSSChoiceCell {
        let categoryIndexPath = NSIndexPath(forRow: 3, inSection: 0)
        return tableView.cellForRowAtIndexPath(categoryIndexPath) as ZSSChoiceCell
    }
    
    
    func getChoices() -> [String: Bool] {
        let choices = getChoiceCell().selectedChoice()
        return ["isPublic" : choices.0, "isPrivate" : choices.1, "isHidden" : choices.2]
    }
    
    func getGroupDescriptionCell() -> ZSSTextViewCell {
        let groupDescriptionIndexPath = NSIndexPath(forRow: 4, inSection: 0)
        return tableView.cellForRowAtIndexPath(groupDescriptionIndexPath) as ZSSTextViewCell
    }
    
    func getGroupDescription() -> String {
        return getGroupDescriptionCell().textView.text
    }
    
    
    func cancel() -> Void {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
