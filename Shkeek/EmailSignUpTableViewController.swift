//
//  ZSSSignUpTableViewController.swift
//
//
//  Created by Zachary Shakked on 3/18/15.
//
//

import UIKit

class EmailSignUpTableViewController : UITableViewController {
    //FIXME add username check if available
    //FIXME add email check if available
    
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
                cell.fieldLabel?.text = "First Name"
            case 2:
                cell.fieldLabel?.text = "Last Name"
            case 3:
                cell.fieldLabel?.text = "Email"
            case 4:
                cell.fieldLabel?.text = "Username"
            case 5:
                cell.fieldLabel?.text = "Password"
                cell.textField.secureTextEntry = true
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
        navigationController?.popViewControllerAnimated(true)
    }
    
    func done() -> Void {
        if areFieldsValid() {
            let userInfo : [String: String] = ["firstName" : getFirstNameFromCell(), "lastName" : getLastNameFromCell(), "email" : getEmailFromCell(), "username" : getUsernameFromCell(), "password" : getPasswordFromCell()]
            ZSSLoginQuerier.sharedQuerier.signUpAndConfigureEmailLinkedUser(userInfo: userInfo, completion: { (succeeded, error) -> Void in
                if succeeded {
                    self.showEULA()
                } else {    
                    println("error: \(error!)")
                }
            })
        }
    }
    
    func showEULA() -> Void {
        let evc = ZSSEulaViewController()
        let nav = UINavigationController(rootViewController: evc)
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    func areFieldsValid() -> Bool {
        var areValid : Bool = true
        
        let firstName = getFirstNameFromCell()
        let lastName = getLastNameFromCell()
        let email = getEmailFromCell()
        let username = getUsernameFromCell()
        let password = getPasswordFromCell()
        
        if (firstName.utf16Count <= 0) {
            areValid = false
            getFirstNameCell().backgroundColor = UIColor.errorColor()
        }
        if (lastName.utf16Count <= 0) {
            areValid = false
            getLastNameCell().backgroundColor = UIColor.errorColor()
        }
        if (!email.isValidEmail()) {
            areValid = false
            getEmailCell().backgroundColor = UIColor.errorColor()
        }
        if (username.utf16Count <= 0) {
            areValid = false
            getUsernameCell().backgroundColor = UIColor.errorColor()
        }
        if (password.utf16Count <= 6) {
            areValid = false
            getPasswordCell().backgroundColor = UIColor.errorColor()
        }
        
        return areValid
    }
    
    func getFirstNameFromCell() -> String {
        return getFirstNameCell().textField.text
    }
    
    func getFirstNameCell() -> ZSSTextFieldCell {
        let firstNameIndexPath = NSIndexPath(forRow: 1, inSection: 0)
        return tableView.cellForRowAtIndexPath(firstNameIndexPath) as ZSSTextFieldCell
    }
    
    
    func getLastNameFromCell() -> String {
        return getLastNameCell().textField.text
    }
    
    func getLastNameCell() -> ZSSTextFieldCell {
        let lastNameIndexPath = NSIndexPath(forRow: 2, inSection: 0)
        return tableView.cellForRowAtIndexPath(lastNameIndexPath) as ZSSTextFieldCell
    }
    
    
    func getEmailFromCell() -> String {
        return getEmailCell().textField.text
    }
    
    func getEmailCell() -> ZSSTextFieldCell {
        let emailIndexPath = NSIndexPath(forRow: 3, inSection: 0)
        return tableView.cellForRowAtIndexPath(emailIndexPath) as ZSSTextFieldCell
    }
    
    
    func getUsernameFromCell() -> String {
        return getUsernameCell().textField.text
    }
    
    func getUsernameCell() -> ZSSTextFieldCell {
        let usernameIndexPath = NSIndexPath(forRow: 4, inSection: 0)
        return tableView.cellForRowAtIndexPath(usernameIndexPath) as ZSSTextFieldCell
    }
    
    
    func getPasswordFromCell() -> String {
        return getPasswordCell().textField.text
    }
    
    func getPasswordCell() -> ZSSTextFieldCell {
        let passwordIndexPath = NSIndexPath(forRow: 5, inSection: 0)
        return tableView.cellForRowAtIndexPath(passwordIndexPath) as ZSSTextFieldCell
    }
}
