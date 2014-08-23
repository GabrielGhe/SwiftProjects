//
//  ViewController.swift
//  App9DrawApp
//
//  Created by Gabriel on 2014-06-30.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var drawView : AnyObject
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearTapped(sender : AnyObject) {
        var myInst = drawView as DrawView
        myInst.lines = []
        myInst.setNeedsDisplay()
    }

}

