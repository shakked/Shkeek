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

    override init() {
        super.init(nibName: "ZSSEulaViewController", bundle: NSBundle.mainBundle())
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var iAgreeButton: UIButton!

    @IBAction func iAgreeButtonPressed(sender: AnyObject) {
        ZSSLoginQuerier.sharedQuerier.agreeToEULA { (succeeded: Bool, error: NSError?) -> Void in
            if succeeded {
                self.showHome()
            } else {
                println("Something went wrong in agreeToEula()")
            }
        }
    }
    
    func showHome() -> Void{
        let hvc = ZSSHomeViewController()
        let nav = UINavigationController(rootViewController: hvc)
        presentViewController(nav, animated: true, completion: nil)
    }
    

}
