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
            return 1
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
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("buttonCell", forIndexPath: indexPath) as ZSSButtonCell
                cell.button.setTitle("Sign up", forState: UIControlState.Normal)
                println(indexPath)
                return cell
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
