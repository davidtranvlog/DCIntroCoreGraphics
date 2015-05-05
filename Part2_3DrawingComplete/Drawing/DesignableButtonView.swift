//
//  DesignableButtonView.swift
//  Drawing
//
//  Created by Developer Inspirus on 4/18/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit

// Draw:
//  1. define a path (tells CG about the line to trace)
//  2. stroke / fill

// Use UIBezierPath

@IBDesignable class DesignableButtonView: UIButton
{
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true
    
    override func drawRect(rect: CGRect) {
        // do the drawings here
        var path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        drawSign()
    }
    
    func drawSign()
    {
        drawHorizontalDash()
        if isAddButton {
            drawVerticalDash()
        }
    }
    
    func drawHorizontalDash()
    {
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        // create the path
        var plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
        
        plusPath.moveToPoint(CGPoint(x: bounds.width/2 - plusWidth/2, y:  bounds.height/2))
        plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + plusWidth/2, y: bounds.height/2))
        
        UIColor.whiteColor().setStroke()
        plusPath.stroke()
    }
    
    func drawVerticalDash()
    {
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        var plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
        
        plusPath.moveToPoint(CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 - plusWidth/2 + 0.5))
        plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 + plusWidth/2 + 0.5))
        
        UIColor.whiteColor().setStroke()
        plusPath.stroke()

    }
   
}

// Draw on the UIView's graphics context
// iOS calls drawRect when:
    // 1. the view is new to the screen
    // 2. other views on top of it is moved
    // 3. hidden property is changed
    // 4. We explicitly call setNeedsDisplay(), setNeedsDisplayInRect()
// DO NOT EVER EVER CALL drawRect DIRECTLY!!!!
// drawRect IS CALLED BY THE SYSTEM
























