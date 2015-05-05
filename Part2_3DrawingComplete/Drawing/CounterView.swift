//
//  CounterView.swift
//  Drawing
//
//  Created by Developer Inspirus on 4/26/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit

let numberOfGlasses = 8
let pi:CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= numberOfGlasses {
                // re-draw
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
        
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // drawing code
        
        // define the center point of the view where we'll rotate the arc around
        let center = CGPoint(x:bounds.width/2, y:bounds.height/2)
        
        // calculate the radius based on the max dimension of the view
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // define the thickness of the arc
        let arcWidth: CGFloat = 76
        
        // define the start and end angles of the arc
        let startAngle: CGFloat = 3*pi/4
        let endAngle: CGFloat = pi/4
        
        drawArc(center, radius: radius, arcWidth: arcWidth, startAngle: startAngle, endAngle: endAngle)
        drawOutline(center, radius: radius, arcWidth: arcWidth, startAngle: startAngle, endAngle: endAngle)
    }

    private func drawArc(center: CGPoint, radius: CGFloat, arcWidth: CGFloat, startAngle: CGFloat, endAngle: CGFloat)
    {
        // create a path based on the points and widths we defined
        var path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
    }
    
    // draw the outline
    private func drawOutline(center: CGPoint, radius: CGFloat, arcWidth: CGFloat, startAngle: CGFloat, endAngle: CGFloat)
    {
        // calulate the difference between two angles ensuring it is positve
        let angleDifference: CGFloat = 2 * pi - startAngle + endAngle
        
        // calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(numberOfGlasses)
        
        // multiply out by the actual glass drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        // draw the outer arc
        var outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        // draw the inner arc
        outlinePath.addArcWithCenter(center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        // close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
        
    }

}



















