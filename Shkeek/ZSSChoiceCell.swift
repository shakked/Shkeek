//
//  ZSSChoiceCell.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/21/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSChoiceCell: UITableViewCell {

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var button1pressedBlock : (Void) -> Void
    var button2pressedBlock : (Void) -> Void
    var button3pressedBlock : (Void) -> Void
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var button3: UIButton!
    
    @IBAction func button1pressed(sender: AnyObject) {
        button1pressedBlock()
    }
    
    @IBAction func button2pressed(sender: AnyObject) {
        button2pressedBlock()
    }
    
    @IBAction func button3pressed(sender: AnyObject) {
        button3pressedBlock()
    }
}
