//
//  DescriptionView.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class DescriptionView: UIView {
    
    //Draws the description to the PieCharts in the PieChartView.
    override func drawRect(rect: CGRect) {
        
        var GoodPosture = UIBezierPath(arcCenter: CGPoint(x: bounds.width/6, y: 20),
            radius: CGFloat(10.0),
            startAngle: CGFloat(0),
            endAngle: CGFloat(2*π),
            clockwise: true)
        
        color1.setFill()
        GoodPosture.fill()
        
        var BadPosture = UIBezierPath(arcCenter: CGPoint(x: bounds.width/6, y: 50),
            radius: CGFloat(10.0),
            startAngle: CGFloat(0),
            endAngle: CGFloat(2*π),
            clockwise: true)
        
        color2.setFill()
        BadPosture.fill()
        
        
        var NotInUse = UIBezierPath(arcCenter: CGPoint(x: bounds.width/6, y: 80),
            radius: CGFloat(10.0),
            startAngle: CGFloat(0),
            endAngle: CGFloat(2*π),
            clockwise: true)
        
        color1.setStroke()
        NotInUse.lineWidth = CGFloat(1.0)
        NotInUse.stroke()
    }
}
