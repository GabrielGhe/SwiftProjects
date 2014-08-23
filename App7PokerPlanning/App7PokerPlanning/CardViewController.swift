//
//  CardViewController.swift
//  App7PokerPlanning
//
//  Created by Gabriel on 2014-06-27.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class CardViewController:UIViewController {
    
    var value:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayButton(){
        let buttonRect = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        let button = UIButton(frame: buttonRect)
        
        button.backgroundColor = UIColor.whiteColor()
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        button.setTitle("\(value)", forState: UIControlState.Normal)
        
        button.addTarget(self, action: Selector("buttonClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func buttonClicked(){
        self.presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
