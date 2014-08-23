//
//  ViewController.swift
//  App7PokerPlanning
//
//  Created by Gabriel on 2014-06-27.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func halfPressed(sender : AnyObject) {
        let viewController =  CardViewController()
        viewController.value = 0.5
        viewController.displayButton()
        self.presentViewController(viewController, animated: true, completion: nil)
    }
}

