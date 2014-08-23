//
//  ViewController.swift
//  App11Happinesss
//
//  Created by Gabriel on 2014-07-22.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FaceViewDelegate {
    
    @IBOutlet var slider : UISlider
    @IBOutlet var faceView : FaceView
    var happiness:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        faceView.delegate = self
        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        self.slider.value = self.happiness
        self.faceView.setNeedsDisplay()
    }
    
    func smileForFaceView(requestor: FaceView) -> Float {
        var smile:Float = 0
        if requestor == self.faceView {
            smile = (Float(self.happiness) - 50) / 50
        }
        return smile
    }

    @IBAction func hapinessChanged(sender : UISlider) {
        self.happiness = sender.value
        self.updateUI()
    }
}

