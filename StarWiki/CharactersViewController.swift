//
//  CharactersViewController.swift
//  StarWiki
//
//  Created by macbook on 28/07/2016.
//  Copyright © 2016 John Veronelli. All rights reserved.
//

import UIKit
import Alamofire



class CharactersViewController: UITableViewController {
    
    var resp : [AnyObject]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "galaxy"))
        tableView?.reloadData()
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
        return (resp?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("chars", forIndexPath: indexPath) as! charTableViewCell
        cell.charName.text = String(resp[indexPath.row]["name"]!!)
        
        // Configure the cell...

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //sends data to the detail view
        if segue.identifier == "showPeopleDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! PeopleDetailController
                controller.list = resp
                controller.index = indexPath.row
            }
        }
    }
    
    @IBAction func back(segue:UIStoryboardSegue) {
        
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    

}
