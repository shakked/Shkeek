//
//  ZSSSignUpTableViewController.swift
//
//
//  Created by Zachary Shakked on 3/18/15.
//
//

import UIKit

class EmailSignUpTableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "ZSSTextFieldCell", bundle: nil), forCellReuseIdentifier: "fieldCell")
        tableView.registerNib(UINib(nibName: "ZSSProfilePicCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        tableView.backgroundColor? = UIColor.cloudColor()
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
