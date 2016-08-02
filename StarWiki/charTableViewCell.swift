//
//  charTableViewCell.swift
//  StarWiki
//
//  Created by macbook on 28/07/2016.
//  Copyright © 2016 John Veronelli. All rights reserved.
//

import UIKit

let CellMargin: CGFloat = 8.0;

class charTableViewCell: UITableViewCell {
    
    @IBOutlet weak var charName: UILabel!
    
    override var frame: CGRect {
        get {
            return super.frame;
        }
        set {
            var newFrame = newValue;
            newFrame.origin.y += (CellMargin - 2);
            newFrame.origin.x += CellMargin;
            newFrame.size.height -= CellMargin;
            newFrame.size.width -= 2.0 * CellMargin;
            super.frame = newFrame;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tintColor = UIColor.clearColor()
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated);
    }
}