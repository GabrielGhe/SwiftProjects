//
//  TipInCellAnimator.swift
//  CardTilt
//
//  Created by Gabriel Gheorghian on 2014-09-08.
//  Copyright (c) 2014 RayWenderlich.com. All rights reserved.
//

import UIKit
import QuartzCore

let TipInCellAnimatorStartTransform:CATransform3D = {
    // Variables
    let rotationDegrees: CGFloat = -15.0
    let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
    let offset = CGPointMake(-20, -20)
    var startTransform = CATransform3DIdentity
    
    // Rotate Identity 15 degrees counter clockwise
    startTransform = CATransform3DRotate(CATransform3DIdentity,
        rotationRadians, 0.0, 0.0, 1.0)
    
    // Translate the card a bit
    startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
    
    return startTransform
}()

class TipInCellAnimator {
    
    class func animate(cell: UITableViewCell) {
        let view = cell.contentView
        view.layer.opacity = 0.1
        UIView.animateWithDuration(1.4, animations: {
            view.layer.opacity = 1
        })
    }
    
    class func animateByRotating(cell: UITableViewCell) {
        let view = cell.contentView
        
        // Initial state
        view.layer.transform = TipInCellAnimatorStartTransform
        view.layer.opacity = 0.8
        
        // Animate back to normal
        UIView.animateWithDuration(0.4) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
}