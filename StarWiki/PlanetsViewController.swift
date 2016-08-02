//
//  PlanetsViewController.swift
//  StarWiki
//
//  Created by macbook on 02/08/2016.
//  Copyright © 2016 John Veronelli. All rights reserved.
//

import UIKit
import Alamofire

class PlanetsViewController: UITableViewController {

    var resp = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "galaxy"))
        fillPlanets(1)
    }
    
    func fillPlanets(index: Int){
        //repeats API requests until all the pages are loaded
        var x = index
        while x <= 7{
            let url = "http://swapi.co/api/planets/?page=\(x)"
            getPlanetsList(url)
            x = x + 1
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
        return resp.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("planets", forIndexPath: indexPath) as! charTableViewCell
        if resp.count > 0{
            cell.charName.text = String(resp[indexPath.row]["name"]!!)
        }
        
        // Configure the cell...
        
        return cell
    }
    
    func getPlanetsList(url : String){
        //gets the planets list from the API
        Alamofire.request(.GET, url, encoding:.JSON).responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                let response = JSON as! NSDictionary
                let list = response.objectForKey("results") as! [AnyObject]
                self.resp += list
                self.tableView.reloadData()
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
    }
    
    @IBAction func backToPlanets(segue:UIStoryboardSegue) {
        
    }
    
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        //rearranging the table view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //sends data to the detail view
        if segue.identifier == "showPlanetDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! PlanetsDetailController
                controller.list = resp
                controller.index = indexPath.row
            }
        }
    }

}
