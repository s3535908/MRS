//
//  DrawPieChart.swift
//  PP
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//
import UIKit

class DrawPieChart {

func DrawPC(GoodPostureValue:CGFloat, BadPostureValue:CGFloat, Height:CGFloat, Width:CGFloat){
    
    let center = CGPoint(x:Width/2, y: Height/2)
    let OutlineWidth = CGFloat(1.0)
    let OutlineSpacing = CGFloat(2.0)
    let OutlineRadius = CGFloat((max(Width, Height)/2)-OutlineWidth)
    
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

