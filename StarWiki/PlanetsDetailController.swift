//
//  PlanetsDetailController.swift
//  StarWiki
//
//  Created by macbook on 02/08/2016.
//  Copyright © 2016 John Veronelli. All rights reserved.
//

import UIKit

class PlanetsDetailController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rotation: UILabel!
    @IBOutlet weak var oPeriod: UILabel!
    @IBOutlet weak var diameter: UILabel!
    @IBOutlet weak var climate: UILabel!
    @IBOutlet weak var gravity: UILabel!
    @IBOutlet weak var terrain: UILabel!
    @IBOutlet weak var water: UILabel!
    
    var list : [AnyObject]!
    var index : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = String(list[index]["name"]!!)
        rotation.text = String(list[index]["rotation_period"]!!)
        oPeriod.text = String(list[index]["orbital_period"]!!)
        diameter.text = String(list[index]["diameter"]!!)
        climate.text = String(list[index]["climate"]!!)
        gravity.text = String(list[index]["gravity"]!!)
        terrain.text = String(list[index]["terrain"]!!)
        water.text = String(list[index]["surface_water"]!!)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
