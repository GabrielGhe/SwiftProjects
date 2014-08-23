//
//  ViewController.swift
//  App6Timer
//
//  Created by Gabriel on 2014-06-27.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0
    @IBOutlet var labelCounter : UILabel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCounter.text = "\(0)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startCounterPressed(sender : AnyObject) {
        update()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    func update(){
        labelCounter.text = "\(counter++)"
    }
    
    @IBAction func stopCounterPressed(sender : AnyObject) {
        timer.invalidate()
    }
    
    
    @IBAction func clearPressed(sender : AnyObject) {
        timer.invalidate()
        counter = 0
        labelCounter.text = "\(counter)"
    }
    
}