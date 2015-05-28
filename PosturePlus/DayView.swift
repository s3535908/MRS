//
//  DayView.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class DayView: UIView {
    
    let data = Model().getPCdata(DayInSec)
    
    override func drawRect(rect: CGRect) {
        
        var GoodPostureValue = CGFloat(data.GPData)/CGFloat(DayInSec/60)*2*π
        var BadPostureValue = CGFloat(data.BPData)/CGFloat(DayInSec/60)*2*π
        let height = bounds.height
        let width = bounds.width
        
        DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
}
