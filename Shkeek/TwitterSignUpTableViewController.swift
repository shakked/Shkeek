//
//  TwitterSignUpTableViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/18/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class TwitterSignUpTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()

    }
 
    func configureViews() -> Void {
        configureTableView()
        configureNavBar()
    }
    
    func configureTableView() -> Void {
        tableView.registerNib(UINib(nibName: "ZSSTextFieldCell", bundle: nil), forCellReuseIdentifier: "fieldCell")
        tableView.registerNib(UINib(nibName: "ZSSProfilePicCell", bundle: nil), forCellReuseIdentifier: "profileCell")
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return 4
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
                cell.fieldLabel?.text = "First Name"
            case 2:
                cell.fieldLabel?.text = "Last Name"
            case 3:
                cell.fieldLabel?.text = "Email"
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
    
    func cancel() -> Void {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func done() -> Void {
        if areFieldsValid() {
            let userInfo : [String : AnyObject] = ["firstName" : getFirstNameFromCell(), "lastName" : getLastNameFromCell(), "email" : getEmailFromCell()]
            ZSSLoginQuerier.sharedQuerier.configureTwitterLinkedUser(userInfo: userInfo, completion: { (succeeded, error) -> Void in
                if succeeded {
                    ZSSUserSyncer.sharedQuerier.syncLocalUserToCloudUser()
                    let evc = ZSSEulaViewController()
                    
                } else {
                    //error
                }
            })
        }
    }
    
    func areFieldsValid() -> Bool {
        var areValid : Bool
        
        let firstName : String = getFirstNameFromCell()
        let lastName : String = getLastNameFromCell()
        let email : String = getEmailFromCell()
        
        if (firstName.utf16Count <= 0 || lastName.utf16Count <= 0 || email.utf16Count <= 0 || !email.isValidEmail()) {
            areValid = false
            println("not valid input")
        } else {
            areValid = true
            println("valid input")
        }
        
        return areValid
        
    }
    
    func getFirstNameFromCell() -> String {
        
        let firstNameCell = getFirstNameCell()
        let firstName = firstNameCell.textField.text
        return firstName
    }
    
    func getFirstNameCell() -> ZSSTextFieldCell {
        let firstNameIndexPath = NSIndexPath(forRow: 1, inSection: 0)
        let firstNameCell = tableView.cellForRowAtIndexPath(firstNameIndexPath) as ZSSTextFieldCell
        return firstNameCell
    }
    
    func getLastNameFromCell() -> String {
        let lastNameCell = getLastNameCell()
        let lastName = lastNameCell.textField.text
        return lastName
    }
    
    func getLastNameCell() -> ZSSTextFieldCell {
        let lastNameIndexPath = NSIndexPath(forRow: 2, inSection: 0)
        let lastNameCell = tableView.cellForRowAtIndexPath(lastNameIndexPath) as ZSSTextFieldCell
        return lastNameCell
    }
    
    func getEmailFromCell() -> String {
        let emailCell = getEmailCell()
        let email : String = emailCell.textField.text
        return email
    }
    
    func getEmailCell() -> ZSSTextFieldCell {
        let emailIndexPath : NSIndexPath = NSIndexPath(forRow: 3, inSection: 0)
        let emailCell : ZSSTextFieldCell = tableView.cellForRowAtIndexPath(emailIndexPath) as ZSSTextFieldCell
        return emailCell
    }
    
    
}
