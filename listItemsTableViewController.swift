//
//  listItemsTableViewController.swift
//  IPE Checklist
//
//  Created by Evan Madill on 11/28/15.
//  Copyright © 2015 Evan Madill. All rights reserved.
//

import UIKit

protocol sendListItems {
    func sendListItemsBack(itemsSentBack: Array<Bool>, examSelected: String)
}

class listItemsTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var listTitle2 = String()
    var itemSelected = [Bool]()
    var data2:Array<String> = Array()
    var listItemsDelegate:sendListItems!
    
    //Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
     
    }
    
    //Load corresponding exam
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data2.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listTitle2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listItem", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = data2[indexPath.row] as String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Fade text in and out on selection
        
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if itemSelected[indexPath.row] == true {
            itemSelected[indexPath.row] = false
            selectedCell.textLabel?.alpha = 1.0
        }
        else if itemSelected[indexPath.row] == false {
            itemSelected[indexPath.row] = true
            selectedCell.textLabel?.alpha = 0.2
        }
        
        //Send selection back -- updating too frequently
        listItemsDelegate!.sendListItemsBack(itemSelected, examSelected: listTitle2)
        
    }
    
    /*
    func sendListItemsBack(itemsSentBack: Array<Bool>) {
        self.listItemsDelegate?.sendListItemsBack(itemSelected, sentBackBool: true)
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
