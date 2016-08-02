//
//  PeopleDetailController.swift
//  StarWiki
//
//  Created by macbook on 01/08/2016.
//  Copyright © 2016 John Veronelli. All rights reserved.
//

import UIKit

class PeopleDetailController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var eyes: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var skin: UILabel!
    
    var list : [AnyObject]!
    var index : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = String(list[index]["name"]!!)
        birth.text = String(list[index]["birth_year"]!!)
        eyes.text = String(list[index]["eye_color"]!!)
        gender.text = String(list[index]["gender"]!!)
        hair.text = String(list[index]["hair_color"]!!)
        height.text = String(list[index]["height"]!!)
        mass.text = String(list[index]["mass"]!!)
        skin.text = String(list[index]["skin_color"]!!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
