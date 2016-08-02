//
//  ShipsDetailController.swift
//  StarWiki
//
//  Created by macbook on 02/08/2016.
//  Copyright © 2016 John Veronelli. All rights reserved.
//

import UIKit

class ShipsDetailController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var cargo: UILabel!
    @IBOutlet weak var consumables: UILabel!
    @IBOutlet weak var sClass: UILabel!
    
    var list : [AnyObject]!
    var index : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = String(list[index]["name"]!!)
        model.text = String(list[index]["model"]!!)
        model.adjustsFontSizeToFitWidth = true
        manufacturer.text = String(list[index]["manufacturer"]!!)
        manufacturer.adjustsFontSizeToFitWidth = true
        crew.text = String(list[index]["crew"]!!)
        passengers.text = String(list[index]["passengers"]!!)
        cargo.text = String(list[index]["cargo_capacity"]!!)
        consumables.text = String(list[index]["consumables"]!!)
        sClass.text = String(list[index]["starship_class"]!!)
        sClass.adjustsFontSizeToFitWidth = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
