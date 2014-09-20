//
//  ViewController.swift
//  App14Transition1
//
//  Created by Gabriel Gheorghian on 2014-09-20.
//  Copyright (c) 2014 genunine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set container frame and add to the screen
        self.container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
        self.view.addSubview(container)
        
        // set red square frame up
        // we want the blue square to have the same position as redSquare
        // so lets just reuse blueSquare.frame
        self.redSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.blueSquare.frame = redSquare.frame
        
        // set background colors
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        // for now just add the redSquare
        // we'll add blueSquare as part of the transition animation
        self.container.addSubview(self.redSquare)
    }
    
    @IBAction func performAction(sender: AnyObject) {
        var views = (frontView: self.redSquare, backView: self.blueSquare)
        if self.redSquare.superview ==  nil {
            views = (frontView: self.blueSquare, backView: self.redSquare)
        }
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
    }
}

