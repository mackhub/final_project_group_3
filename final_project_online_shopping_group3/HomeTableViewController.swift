//
//  HomeTableViewController.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei Konovalov on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData
class HomeTableViewController: UITableViewController, UISearchResultsUpdating {

    
    
    let Items:[Item] = [
        Item(Name:"Dell XPS 13 9350",ImageS:"1 60", ImageL:"1 350",Price:907.99),
        Item(Name:"Lenovo Yoga 710 11",ImageS:"2 60", ImageL:"2 350",Price:800),
        Item(Name:"Asus ZenBook UX310UA",ImageS:"3 60", ImageL:"3 350",Price:848),
        Item(Name:"Dell Latitude 13 7370",ImageS:"4 60", ImageL:"4 350",Price:710),
        Item(Name:"HP Envy 13",ImageS:"5 60", ImageL:" 5 350",Price:700),
        Item(Name:"Acer S 13 S5-371",ImageS:"6 60", ImageL:"6 350",Price:750),
        Item(Name:"Microsoft Surface Book",ImageS:"7 60", ImageL:"7 350",Price:1214),
        Item(Name:"Toshiba Chromebook 2",ImageS:"8 60", ImageL:"8 350",Price:190),
        Item(Name:"13-inch MacBook Air",ImageS:"9 60", ImageL:"9 350",Price:979),
        Item(Name:"Apple MacBook",ImageS:"10 60", ImageL:"10 350",Price:1268),
        Item(Name:"Lenovo Yoga 900",ImageS:"11 60", ImageL:"11 350",Price:929),
        Item(Name:"Dell Chromebook 11",ImageS:"12 60", ImageL:"12 350",Price:214),
        Item(Name:"HP Spectre 13",ImageS:"13 60", ImageL:"13 350",Price:1250),
        Item(Name:"Retina MacBook Pro",ImageS:"14 60", ImageL:"14 350",Price:1069),
        Item(Name:"Dell Inspiron 13 5000",ImageS:"15 60", ImageL:"15 350",Price:714),
        Item(Name:"HP Envy 15-",ImageS:"16 60", ImageL:"16 350",Price:819),
        Item(Name:"13-inch Retina MacBook Pro",ImageS:"17 60", ImageL:"17 350",Price:1279),
        Item(Name:"Microsoft Surface Pro 4",ImageS:"18 60", ImageL:"18 350",Price:999),
        Item(Name:"Microsoft Surface Pro 3",ImageS:"19 60", ImageL:"19 350",Price:666),
        Item(Name:"New MacBook Pro ",ImageS:"20 60", ImageL:"20 350",Price:1799)
    ]
   

    @IBAction func singout(sender: UIButton) {
        self.performSegueWithIdentifier("goto_login", sender: self)
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let fr = NSFetchRequest(entityName: "Data")
        do{
        let res = try moc.executeFetchRequest(fr)
            for moca in res{
                let mocal:NSManagedObject = moca as! NSManagedObject
                moc.deleteObject(mocal)
            }
        }catch {
            print("error")
        }}
        
    var SVarr = [Int](count: 20, repeatedValue: 0)
   
    var NewOrder: Order!
    
    var searchController: UISearchController!
    var searchResults: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
         //self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//                let fr = NSFetchRequest(entityName:"Data")
//                var e: NSError?
//                do {
//                    try self.Items = self.moc.executeFetchRequest(fr) as! [Item]
//                }
//                catch is NSError {
//                    print("error")
//                }
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = self.searchController.searchBar
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("goto_login", sender: self)
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
        if searchController.active{
            return searchResults.count
        }
        else{
            return Items.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellidntifier = "HomeCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellidntifier, forIndexPath: indexPath) as! HomeTableViewCell
        var sItem: Item!
        if searchController.active{
            sItem = searchResults[indexPath.row]
        }
        else{
            sItem = Items[indexPath.row]
        }
        
        cell.cellname?.text = sItem.Name
        cell.cellprice?.text = String(sItem.Price)
        //SVarr[indexPath.row] = Int((cell.cellstepper?.value)!)
        cell.cellimage?.frame = CGRect (x: 0.0, y: 0.0, width: 60, height: 60)
        cell.cellimage?.layer.cornerRadius = cell.cellimage.frame.size.width/2.0
        cell.cellimage?.clipsToBounds = true
        cell.cellimage?.layer.masksToBounds = true
        cell.cellimage?.image = UIImage(named:sItem.ImageS)
       
        cell.alpha = 0
        UIView.animateWithDuration(2, animations: {cell.alpha = 1})
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    //    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    //        // Return false if you do not want the specified item to be editable.
    //        return true
    //    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var alert = UIAlertController(title: "Added " + Items[indexPath.row].Name + " to the Bin", message:"", preferredStyle: .Alert)
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler:{ (UIAlertAction) in
            print("cancel logic") }))
        
        alert.addAction(UIAlertAction(title: "Done", style: .Default, handler:{ (UIAlertAction) in
            
            
            let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

            self.NewOrder = NSEntityDescription.insertNewObjectForEntityForName("Data", inManagedObjectContext: moc) as! Order
            
            self.NewOrder.name = self.Items[indexPath.row].Name
            print(self.Items[indexPath.row].Name)
            
            self.NewOrder.image = self.Items[indexPath.row].ImageS
            print(self.Items[indexPath.row].ImageS)
            let a: Int = 3
            self.NewOrder.price = self.Items[indexPath.row].Price
            self.NewOrder.amount = (self.tableView.cellForRowAtIndexPath(indexPath) as! HomeTableViewCell).cellstepper.value
           // var e: NSError
            do{
                try moc.save()
            }
            catch {
                print("error")
            }
        }))
        
        self.presentViewController(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    //
    //    // Override to support editing the table view.
    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == .Delete {
    //            // Delete the row from the data source
    //            Items.removeAtIndex(indexPath.row)
    //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //        } else if editingStyle == .Insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //        }
    //
    //        //self.tableView.reloadData()
    //    }
    
    
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
    func filterContentForSearchText(searchText: String){
        searchResults = Items.filter({(BuyItem:Item) ->Bool in
            let nameMatch = BuyItem.Name.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return nameMatch != nil
        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            filterContentForSearchText(searchText)
            tableView.reloadData()
        }
    }
}
