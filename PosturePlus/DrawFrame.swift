//
//  DrawFrame.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class DrawFrame: UIView {

    //Draws a frame around the CoreID and AccessToken textfields and labels in the CoreInfoView.
    let OutlineWidth = CGFloat(5.0)
    
    override func drawRect(rect: CGRect) {
        var rect = CGRect(x: OutlineWidth/2, y: OutlineWidth/2, width: bounds.width-OutlineWidth, height: bounds.height-OutlineWidth)
        var framePath = UIBezierPath(roundedRect: rect, cornerRadius: 20.0)
        color1.setStroke()
        framePath.lineWidth = OutlineWidth
        framePath.stroke()
    }

}
