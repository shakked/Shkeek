//
//  ZSSGroupCell.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/30/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSGroupCell: UITableViewCell {

    @IBOutlet weak var groupPicImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
