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
        
        imageView1.layer.masksToBounds = true
        imageView1.layer.cornerRadius = 12;
        imageView1.layer.borderColor = UIColor.grayColor().CGColor
        imageView1.layer.borderWidth = 2.0
        imageView1.userInteractionEnabled = true
        let tapImageView1 = UITapGestureRecognizer(target: self, action: Selector("chocie1buttonPressed:"))
        imageView1.addGestureRecognizer(tapImageView1)
        
        imageView2.layer.masksToBounds = true
        imageView2.layer.cornerRadius = 12;
        imageView2.layer.borderColor = UIColor.grayColor().CGColor
        imageView2.layer.borderWidth = 2.0;
        let tapImageView2 = UITapGestureRecognizer(target: self, action: Selector("choice2buttonPressed:"))
        imageView2.addGestureRecognizer(tapImageView2)
        
        imageView3.layer.masksToBounds = true
        imageView3.layer.cornerRadius = 12;
        imageView3.layer.borderColor = UIColor.grayColor().CGColor
        imageView3.layer.borderWidth = 2.0;
        let tapImageView3 = UITapGestureRecognizer(target: self, action: Selector("choice3buttonPressed:"))
        imageView3.addGestureRecognizer(tapImageView3)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        
    }
    
    func selectedChoice() -> (Bool, Bool, Bool) {
        return (isChoice1Selected, isChoice2Selected, isChoice3Selected)
    }

    func imageView1Tapped() -> Void {
        println("imageView1Tapped")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    var isChoice1Selected : Bool = false
    var isChoice2Selected : Bool = false
    var isChoice3Selected : Bool = false
    
    @IBOutlet weak var choice1button: UIButton!
    @IBOutlet weak var choice2button: UIButton!
    @IBOutlet weak var choice3button: UIButton!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
   
    @IBAction func chocie1buttonPressed(sender: AnyObject) {
        resetChocies()
        imageView1.backgroundColor = UIColor.grayColor()
        isChoice1Selected = true
        printChoices()
    }
    
    @IBAction func choice2buttonPressed(sender: AnyObject) {
        resetChocies()
        imageView2.backgroundColor = UIColor.grayColor()
        isChoice2Selected = true
        printChoices()
    }
    
    @IBAction func choice3buttonPressed(sender: AnyObject) {
        resetChocies()
        imageView3.backgroundColor = UIColor.grayColor()
        isChoice3Selected = true
        printChoices()
    }
    
    func resetChocies() -> Void {
        isChoice1Selected = false
        imageView1.backgroundColor = UIColor.clearColor()
        isChoice2Selected = false
        imageView2.backgroundColor = UIColor.clearColor()
        isChoice3Selected = false
        imageView3.backgroundColor = UIColor.clearColor()
    }
    
    func printChoices() -> Void {
        println("Choice 1: \(isChoice1Selected)")
        println("Choice 2: \(isChoice2Selected)")
        println("Choice 3: \(isChoice3Selected)")
    }
    
}
