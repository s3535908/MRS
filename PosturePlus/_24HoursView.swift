//
//  _24HoursView.swift
//  PP_PieChart
//
//  Created by Mads Svendsen on 21/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class _24HoursView: UIView {

    var HoursOfGoodPosture = CGFloat(Model().PieChartDataGood())
    var HoursOfBadPosture = CGFloat(Model().PieChartDataBad())
    
    var color1: UIColor = UIColor(red: 0.35, green: 0.75, blue: 0.45, alpha: 1.0)
    var color2: UIColor = UIColor(red: 0.80, green: 0.35, blue: 0.35, alpha: 1.0)
    
    override func drawRect(rect: CGRect) {
        
        let GoodPostureValue = HoursOfGoodPosture/24*2*π
        let BadPostureValue = HoursOfBadPosture/24*2*π
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let OutlineWidth = CGFloat(1.0)
        let OutlineSpacing = CGFloat(2.0)
        let OutlineRadius = CGFloat((max(bounds.width, bounds.height)/2)-OutlineWidth)
        
        var outlinePath = UIBezierPath(arcCenter: center,
            radius: OutlineRadius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(2*π),
            clockwise: true)
        
        color1.setStroke()
        outlinePath.lineWidth = OutlineWidth
        outlinePath.stroke()
        
        let PieChartRadius = CGFloat(OutlineRadius-OutlineSpacing)
        let GoodPostureStartAngle = CGFloat(1.5*π)
        let GoodPostureEndAngle = CGFloat(GoodPostureValue)+GoodPostureStartAngle
        
        var GoodPostureArc = UIBezierPath()
        GoodPostureArc.moveToPoint(center)
        GoodPostureArc.addArcWithCenter(center,
            radius: PieChartRadius,
            startAngle: GoodPostureStartAngle,
            endAngle: GoodPostureEndAngle,
            clockwise: true)
        GoodPostureArc.closePath()
        
        color1.setFill()
        GoodPostureArc.fill()
        
        let BadPostureStartAngle = CGFloat(GoodPostureEndAngle)
        let BadPostureEndAngle = CGFloat(BadPostureValue) + BadPostureStartAngle
        
        var BadPostureArc = UIBezierPath()
        BadPostureArc.moveToPoint(center)
        BadPostureArc.addArcWithCenter(center,
            radius: PieChartRadius,
            startAngle: BadPostureStartAngle,
            endAngle: BadPostureEndAngle,
            clockwise: true)
        BadPostureArc.closePath()
        
        color2.setFill()
        BadPostureArc.fill()
    }


}
