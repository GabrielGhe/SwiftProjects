//
//  File.swift
//  App11Happinesss
//
//  Created by Gabriel on 2014-07-22.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

protocol FaceViewDelegate {
    func smileForFaceView(requestor:FaceView) -> Float
}

class FaceView: UIView {
    
    var delegate:FaceViewDelegate?
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    func drawCircleAtPoint(p:CGPoint, withRadius radius:CGFloat, context:CGContextRef){
        UIGraphicsPushContext(context)
        CGContextBeginPath(context)
        CGContextAddArc(context, p.x, p.y, radius, 0, CGFloat(2*M_PI), TRUE)
        CGContextStrokePath(context)
        UIGraphicsPopContext()
    }
    
    override func drawRect(rect: CGRect) {
        var midPoint: CGPoint = CGPoint(
            x: (self.bounds.origin.x + self.bounds.size.width/2),
            y: (self.bounds.origin.y + self.bounds.size.height/2))
        
        var size:CGFloat = self.bounds.size.width/2
        
        if self.bounds.size.height < self.bounds.size.width {
            size = self.bounds.size.height / 2
        }
        
        var context = UIGraphicsGetCurrentContext()
        drawCircleAtPoint(midPoint, withRadius:size, context:context)
        
        //EYES
        let EYE_WIDTH:Float = 0.35
        let EYE_HEIGHT:Float = 0.35
        let EYE_RADIUS:Float = 0.1
        var eyePoint:CGPoint = CGPoint()
        eyePoint.x = midPoint.x - size * EYE_WIDTH
        eyePoint.y = midPoint.y - size * EYE_HEIGHT
        
        //Eyes Drawing
        drawCircleAtPoint(eyePoint, withRadius:(size * EYE_RADIUS), context: context)
        eyePoint.x += size * EYE_WIDTH * 2
        drawCircleAtPoint(eyePoint, withRadius:(size * EYE_RADIUS), context: context)
        
        //Mouth
        let MOUTH_WIDTH:Float = 0.45
        let MOUTH_HEIGHT:Float = 0.4
        let MOUTH_SMILE:Float = 0.25
        var mouthStart:CGPoint = CGPoint()
        
        mouthStart.x = midPoint.x - MOUTH_WIDTH * size
        mouthStart.y = midPoint.y + MOUTH_HEIGHT * size
        var mouthEnd:CGPoint = mouthStart
        mouthEnd.x += MOUTH_WIDTH * size * 2
        var mouthP1:CGPoint = mouthStart
        mouthP1.x += MOUTH_WIDTH * size * 2/3
        var mouthP2:CGPoint = mouthEnd
        mouthP2.x -= MOUTH_WIDTH * size * 2/3
        
        //Mouth Drawing
        var smile:Float = 0
        // [-1.0, 1.0]
        if let smileValue = delegate?.smileForFaceView(self){
            smile = smileValue
        }
        if smile < -1.0 { smile = -1.0 }
        if smile > 1.0  { smile = 1.0 }
        var smileOffset:CGFloat = MOUTH_SMILE * size * smile
        mouthP1.y += smileOffset
        mouthP2.y += smileOffset
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, mouthStart.x, mouthStart.y)
        CGContextAddCurveToPoint(context, mouthP1.x, mouthP1.y, mouthP2.x, mouthP2.y, mouthEnd.x, mouthEnd.y)
        CGContextStrokePath(context)
    }
}