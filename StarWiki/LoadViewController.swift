//
//  LoadViewController.swift
//  StarWiki
//
//  Created by macbook on 29/07/2016.
//  Copyright © 2016 John Veronelli. All rights reserved.
//

import UIKit
import ImageIO
import Alamofire

class LoadViewController: UIViewController {
    
    @IBOutlet weak var loadImg: UIImageView!
    
    var completeList = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGif()
        fillChars(1)
    }
    
    func fillChars(index: Int){
        //repeats API requests until all the pages are loaded
        var x = index
        while x <= 9{
            let url = "http://swapi.co/api/people/?page=\(x)"
            getCharsList(url)
            x = x + 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadGif(){
        //loads gif image used in loader screen
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxy.jpg")!)
        let url : NSURL = NSBundle.mainBundle().URLForResource("saber", withExtension: "gif")!
        let lightSaber = UIImage.animatedImageWithAnimatedGIFData(NSData(contentsOfURL: url)!)
        self.loadImg.animationImages = lightSaber!.images
        self.loadImg.animationDuration = lightSaber!.duration
        self.loadImg.image = lightSaber?.images?.last
        self.loadImg.startAnimating()
    }
    
    
    func getCharsList(url : String){
        //gets the peoples list from the API
        Alamofire.request(.GET, url, encoding:.JSON).responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                let response = JSON as! NSDictionary
                let list = response.objectForKey("results") as! [AnyObject]
                self.completeList += list
                if url == "http://swapi.co/api/people/?page=9"{
                    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("tabs") as! UITabBarController;
                    let home = controller.viewControllers?.first as! CharactersViewController
                    home.resp = self.completeList
                    controller.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve;
                    self.presentViewController(controller, animated: true, completion: nil);
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
    }

}
