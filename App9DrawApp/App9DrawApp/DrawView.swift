//
//  DrawView.swift
//  App9DrawApp
//
//  Created by Gabriel on 2014-06-30.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines:[Line] = []
    var lastPoint: CGPoint!
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        lastPoint = touches.anyObject().locationInView(self)
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        var newPoint = touches.anyObject().locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint))
        lastPoint = newPoint
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines {
            //move to start, draw line to end
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        //set color
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextStrokePath(context)
    }
}
