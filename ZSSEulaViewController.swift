//
//  ZSSEulaViewController.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/21/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class ZSSEulaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var iAgreeButton: UIButton!

    @IBAction func iAgreeButtonPressed(sender: AnyObject) {
        ZSSLoginQuerier.sharedQuerier.agreeToEULA { (succeeded: Bool, error: NSError?) -> Void in
            if succeeded {
                ZSSLocalQuerier.sharedQuerier.currentUser().setValue(NSNumber(bool: true), forKey: "didAgreeToEULA")
            } else {
                println("Something went wrong in agreeToEula()")
            }
        }
    }

}
