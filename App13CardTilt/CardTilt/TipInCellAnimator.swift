//
//  TipInCellAnimator.swift
//  CardTilt
//
//  Created by Gabriel Gheorghian on 2014-09-08.
//  Copyright (c) 2014 RayWenderlich.com. All rights reserved.
//

import UIKit
import QuartzCore

class TipInCellAnimator {
    class func animate(cell: UITableViewCell) {
        let view = cell.contentView
        view.layer.opacity = 0.1
        UIView.animateWithDuration(1.4, animations: {
            view.layer.opacity = 1
        })
    }
    
    class func animateByRotating(cell: UITableViewCell) {
        // Variables
        let view = cell.contentView
        let rotationDegrees: CGFloat = -15.0
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        let offset = CGPointMake(-20, -20)
        
        // Initial Transform
        var startTransform = CATransform3DIdentity
        
        // Apply -15 degree rotation on (x,y,z) = (0,0,1)
        startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0)
        
        // Shift the card up
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
        
        // Apply transform to view
        view.layer.transform = startTransform
        view.layer.opacity = 0.8
        
        // Animate the view back to its initial state
        UIView.animateWithDuration(0.4) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
}