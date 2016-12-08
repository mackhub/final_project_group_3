//
//  BinTableViewController.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei Konovalov on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//
import UIKit
import CoreData

class BinTableViewController: UITableViewController {
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var Orders:[Order] = []
    
    
    override func viewWillAppear(animated: Bool) {
        let fr = NSFetchRequest(entityName: "Data")
        var e: NSError?
        
        do {
            try self.Orders = self.moc.executeFetchRequest(fr) as! [Order]
        }
        catch is NSError {
            print("error")
        }
        self.tableView.reloadData()
//        //Orders = moc.executeFetchRequest(fr) as! [Order]
//        if e != nil {
//        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let fr = NSFetchRequest(entityName: "Data")
        var e: NSError?
        
        do {
            try self.Orders = self.moc.executeFetchRequest(fr) as! [Order]
        }
        catch is NSError {
            print("error")
        }
        //Orders = moc.executeFetchRequest(fr) as! [Order]
        if e != nil {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
           return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
     
        return self.Orders.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellidntifier = "BinCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellidntifier, forIndexPath: indexPath) as! BinTableViewCell
        
        cell.cellname?.text = Orders[indexPath.row].name
        cell.cellamount?.text = String(Orders[indexPath.row].amount)
        cell.celltotprice?.text = String(Double(Orders[indexPath.row].price) * Double(Orders[indexPath.row].amount))
        cell.cellimage?.frame = CGRect (x: 0.0, y: 0.0, width: 60, height: 60)
        cell.cellimage?.layer.cornerRadius = cell.cellimage.frame.size.width/2.0
        cell.cellimage?.clipsToBounds = true
        cell.cellimage?.layer.masksToBounds = true
        cell.cellimage?.image = UIImage(named:Orders[indexPath.row].image)
        //stepperlogic________________________________________________ must be written in this file
        // Configure the cell...
        cell.alpha = 0
        UIView.animateWithDuration(2, animations: {cell.alpha = 1})
        return cell
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            Orders.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        //self.tableView.reloadData()
    }
    
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
