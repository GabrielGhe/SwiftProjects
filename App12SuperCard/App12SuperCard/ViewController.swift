//
//  ViewController.swift
//  App12SuperCard
//
//  Created by Gabriel on 2014-08-01.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var playingCardView : PlayingCardView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playingCardView.rank = 13
        self.playingCardView.suit = "♥︎"
        self.playingCardView.faceUp = true
        self.playingCardView.addGestureRecognizer(UIPinchGestureRecognizer(target: playingCardView, action:Selector("pinch:")))
    }
    @IBAction func swipe(sender : AnyObject) {
        self.playingCardView.faceUp = !self.playingCardView.faceUp
    }
}

