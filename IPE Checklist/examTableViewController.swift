//
//  examTableViewController.swift
//  IPE Checklist
//
//  Created by Evan Madill on 11/28/15.
//  Copyright © 2015 Evan Madill. All rights reserved.
//

import UIKit

class examTableViewController: UITableViewController, sendListItems {

    var entList = ["Inspect eyes", "Check for convergence", "Pupillary response to light (direct and consensual)",
    "Check near reflex", "Test visual field", "Inspect optic disc", "Test visual acuity", "Examine tympanic membrane",
    "Test auditory acuity (whisper test)", "Pull auricle/push tragus", "Test nasal patency", "Inspect nostrils", "Palpate for sinus tenderness", "Inspect lips, gums, tongue, and teeth", "Inspect pharynx", "Observe elevation of palate"]
    var neuroList = ["Extraocular muscles (H test)", "Palpate masseter muscles (CN V)", "Muscles of facial expresssion (CN VII)", "Head rotation/shoulder shrug (CN XI)", "Midline protrusion of tongue (CN XII)", "Facial sensation (CN V)", "Ask about gag reflex (CN IX, X)", "Biceps reflex", "Triceps reflex", "Brachioradialis reflex", "Patellar reflex", "Achilles reflex", "Rapid alternating hand movements", "Finger-to-nose test", "Heel-to-shin", "Romberg test", "Observe normal and tandem gait", "Sharp-vs-dull test", "Vibration sensation in hands"]
    var thoracicList = ["Check chest expansion", "Palpate vertebrae", "Percuss kidneys", "Percuss lung fields", "Auscultate lung fields", "Ask about breat exam", "Feel for axillary lymph nodes", "Palpate PMI/Chest wall", "Auscultate heart valves", "Palpate carotids", "Auscultate carotids"]
    var abdominalList = ["Auscultate", "Palpate all quadrents", "Feel for aorta", "Auscultate for bruits", "Percuss liver span"]
    var musculoskeletalList = ["Test arm muscles against resistance", "Check dorsalis pedis and posterior tibial pulse", "Test leg muscles", "Test calf and ankle against resistance"]
    var otherList = ["Chief complaint", "Check blood pressure", "Palpate both radial pulses", "Time radial pulses",
    "Check range of motion in both arms", "Inspect hands, fingers, and fingernails", "Palpate anterior/posterior lymph nodes in neck", "Palpate supraclavicular lymph nodes", "Palpate thyroid", "Look for JVD", "Ask about genital exam", "Ask for final questions"]
    
    var data: Array<String> = Array()
    var listTitle: String = String()
    
    
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
    
    func sendListItemsBack(itemsSentBack: Array<Bool>, examSelected: String) {
        //placeholder for future delegate actions
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier {
        case "entSegue"?:
            data = entList
            listTitle = "ENT"
        case "neuroSegue"?:
            data = neuroList
            listTitle = "Neuro"
        case "thoracicSegue"?:
            data = thoracicList
            listTitle = "Thoracic"
        case "abdominalSegue"?:
            data = abdominalList
            listTitle = "Abdominal"
        case "musculoskeletalSegue"?:
            data = musculoskeletalList
            listTitle = "Musculoskeletal"
        case "otherSegue"?:
            data = otherList
            listTitle = "Other"
        default:
            data = []
            listTitle = "No exam selected"
        }
        
        //Holy shit, it works
        //Access variables in desitination view controller; set them = variables in current VC
        let view2:listItemsTableViewController = segue.destinationViewController as! listItemsTableViewController
        
        view2.data2 = data
        view2.listTitle2 = listTitle
        //for future delegate commands
        view2.listItemsDelegate = self
        
        //Instantiate array length to whatever the number of table rows is
        view2.itemSelected = [Bool](count: data.count, repeatedValue: false)
        
    }


    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
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
