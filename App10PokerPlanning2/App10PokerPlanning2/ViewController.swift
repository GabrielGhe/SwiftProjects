//
//  ViewController.swift
//  App10PokerPlanning2
//
//  Created by Gabriel on 2014-07-16.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var myButton : UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.cornerRadius = 10
        myButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTouchUpInside(sender : AnyObject) {
        var button = sender as UIButton
        switch button.backgroundColor {
            case UIColor.blackColor():
                button.titleLabel.text = "A♠︎"
                button.backgroundColor = UIColor.whiteColor()
            default:
                button.backgroundColor = UIColor.blackColor()
                button.titleLabel.text = ""
        }
    }

}

