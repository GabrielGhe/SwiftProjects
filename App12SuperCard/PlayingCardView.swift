//
//  PlayingCardView.swift
//  App12SuperCard
//
//  Created by Gabriel on 2014-08-01.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
    
    //Scale
    var faceCardScaleFactor: CGFloat = 1.0{
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    //Rank
    var rank: Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    //Suit
    var suit:String = "" {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    //Faceup
    var faceUp: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        self.backgroundColor = nil
        self.opaque = false
        self.contentMode = UIViewContentMode.Redraw
    }
    
    override func drawRect(rect: CGRect) {
        
        //Variables
        let CORNER_FONT_STANDARD_HEIGHT:CGFloat = 180.0
        let CORNER_RADIUS:CGFloat = 12.0
        let cornerScaleFactor:CGFloat = self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT
        let cornerRadius:CGFloat = CORNER_RADIUS * cornerScaleFactor
        let cornerOffset = cornerRadius / 2.0
        
        //Text
        var roundedRect:UIBezierPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        roundedRect.addClip()
        
        roundedRect.stroke()
        
        if (faceUp){
            UIColor.whiteColor().setFill()
            UIRectFill(self.bounds)
            drawCorners()
        } else {
            //Draw back of CARD
            UIColor.blackColor().setFill()
            UIRectFill(self.bounds)
            let image = UIImage(named: "back")
            var imageRect = CGRectInset(self.bounds, self.bounds.size.width * 0.6, self.bounds.size.height *  0.6)
            image.drawInRect(imageRect)
        }
    }
    
    func drawCorners(){
        //Variables
        let CORNER_FONT_STANDARD_HEIGHT:CGFloat = 180.0
        let CORNER_RADIUS:CGFloat = 12.0
        let cornerScaleFactor:CGFloat = self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT
        let cornerRadius:CGFloat = CORNER_RADIUS * cornerScaleFactor
        let cornerOffset = cornerRadius / 2.0
        
        //Text
        var paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center
        
        var cornerFont:UIFont = UIFont.preferredFontForTextStyle("UIFontTextStyleBody")
        cornerFont = cornerFont.fontWithSize(cornerFont.pointSize * cornerScaleFactor)
        
        var cornerText:NSAttributedString = NSAttributedString(string: "\(rankAsString())\n\(suit)",
            attributes: [NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle])
        
        var textBounds = CGRect()
        textBounds.origin = CGPointMake(cornerOffset, cornerOffset)
        textBounds.size = cornerText.size()
        cornerText.drawInRect(textBounds)
        
        
        var context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height)
        CGContextRotateCTM(context, CGFloat(M_PI))
        cornerText.drawInRect(textBounds)
    }
    
    func pinch(gesture:UIPinchGestureRecognizer){
        println("got here, scale (\(gesture.scale))")
        if(gesture.state == UIGestureRecognizerState.Changed || gesture.state == UIGestureRecognizerState.Ended) {
            self.faceCardScaleFactor *= gesture.scale
            gesture.scale = 1.0
        }
    }
    
    func rankAsString() -> String {
        return ["?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"][self.rank]
    }
}
