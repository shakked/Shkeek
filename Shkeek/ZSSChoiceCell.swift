//
//  ZSSChoiceCell.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/21/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSChoiceCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var choice1buttonPressedBlock : ((Void) -> Void)!
    var choice2buttonPressedBlock : ((Void) -> Void)!
    var choice3buttonPressedBlock : ((Void) -> Void)!
    
    var isChoice1Selected : Bool = false
    var isChoide2Selected : Bool = false
    var isChoide3Selected : Bool = false
    
    @IBOutlet weak var choice1button: UIButton!
    @IBOutlet weak var choice2button: UIButton!
    @IBOutlet weak var choice3button: UIButton!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
   
    @IBAction func chocie1buttonPressed(sender: AnyObject) {
        choice1buttonPressedBlock()
    }
    
    @IBAction func choice2buttonPressed(sender: AnyObject) {
        choice2buttonPressedBlock()
    }
    
    @IBAction func choice3buttonPressed(sender: AnyObject) {
        choice3buttonPressedBlock()
    }
    
    
}
