//
//  EmailLoginTableViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/18/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class EmailLoginTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    func configureTableView() -> Void {
        tableView.registerNib(UINib(nibName: "ZSSTextFieldCell", bundle: nil), forCellReuseIdentifier: "fieldCell")
            tableView.registerNib(UINib(nibName: "ZSSButtonCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
        tableView.backgroundColor? = UIColor.cloudColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        default:
            return 0
        }
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("fieldCell", forIndexPath: indexPath) as ZSSTextFieldCell
            switch indexPath.row {
            case 0:
                cell.fieldLabel.text = "Username"
                cell.textField.becomeFirstResponder()
                return cell
            case 1:
                cell.fieldLabel.text = "Password"
                cell.textField.secureTextEntry = true
                return cell
            default:
                return cell
            }
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("buttonCell", forIndexPath: indexPath) as ZSSButtonCell
            switch indexPath.row {
            case 0:
                cell.button.setTitle("Log in", forState: UIControlState.Normal)
                cell.button.titleLabel?.font = UIFont(name: "Avenir", size: 18.0)
                println(indexPath)
                return cell
            case 1:
                cell.button.setTitle("Sign Up", forState: UIControlState.Normal)
            default:
                break
            }
        default:
            break
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("buttonCell", forIndexPath: indexPath) as ZSSButtonCell
        cell.button.setTitle("Sign Up", forState: UIControlState.Normal)
        println(indexPath)
        return cell

        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("indexPath.section: \(indexPath.section), indexPath.row: \(indexPath.row)")
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 0:
                logIn()
            case 1:
                let esutvc : EmailSignUpTableViewController = EmailSignUpTableViewController()
                self.navigationController!.pushViewController(esutvc, animated: true)
            default:
                break
            }
        default:
            break
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func logIn() -> Void {
        ZSSLoginQuerier.sharedQuerier.logInUser(getUsernameFromCell() , password:getPasswordFromCell()) { (succeeded, error) -> Void in
            if succeeded {
                self.showNextView()
            } else {
                
            }
        }
    }
    
    func showNextView() -> Void {

        if shouldShowEULA() {
            showEULA()
        } else {
            showHome()
        }
    }
    
    func shouldShowEULA() -> Bool {
        let localUser = ZSSLocalQuerier.sharedQuerier.currentUser()
        if let didAgreeToEULA = (localUser.valueForKey("didAgreeToEULA") as? NSNumber)?.boolValue {
            if didAgreeToEULA {
                println("shouldNOTShowEULA")
                return false
            } else {
                println("shouldShowEULA")
                return true
            }
        }
        println("shouldShowEULA")
        return true
    }
    
    func showEULA() -> Void {
        let evc = ZSSEulaViewController()
        let nav = UINavigationController(rootViewController: evc)
        presentViewController(nav, animated: true, completion: nil)
    }
    
    func showHome() -> Void {
        let tbc = UITabBarController()
        let gtvc = ZSSGroupsTableViewController()
        let gtvcNav = UINavigationController(rootViewController: gtvc)
        gtvcNav.tabBarItem.title = "Groups"
        tbc.viewControllers = [gtvcNav]
        presentViewController(tbc, animated: true, completion: nil)
    }
    
    
    func getUsernameFromCell() -> String {
        return getUsernameCell().textField.text
    }
    
    func getUsernameCell() -> ZSSTextFieldCell {
        let usernameIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        return tableView.cellForRowAtIndexPath(usernameIndexPath) as ZSSTextFieldCell
    }
    
    
    func getPasswordFromCell() -> String {
        return getPasswordCell().textField.text
    }
    
    func getPasswordCell() -> ZSSTextFieldCell {
        let passwordIndexPath = NSIndexPath(forRow: 1, inSection: 0)
        return tableView.cellForRowAtIndexPath(passwordIndexPath) as ZSSTextFieldCell
    }
}
