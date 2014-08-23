//
//  myViewController2.swift
//  App4
//
//  Created by Gabriel on 2014-06-23.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class myViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toView1Pressed(sender : AnyObject) {
        self.navigationController.popToRootViewControllerAnimated(true)
    }
        
}
