//
//  ZSSAnnouncementCell.swift
//  Shkeek
//
//  Created by Zachary Shakked on 4/8/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSAnnouncementCell: UITableViewCell {
    
    @IBOutlet weak var profileImageview : UIImageView!
    @IBOutlet weak var groupNameLabel : UILabel!
    @IBOutlet weak var authorNameLabel : UILabel!
    @IBOutlet weak var timeLabel : UILabel!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var bodyLabel : UILabel!
    var profileImageTappedBlock:(()->Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("profileImageViewTapped"))
        profileImageview.addGestureRecognizer(tapGesture)
        profileImageview.userInteractionEnabled = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func profileImageViewTapped() -> Void {
        profileImageTappedBlock()
    }
}
