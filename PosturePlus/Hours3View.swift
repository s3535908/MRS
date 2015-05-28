//
//  DayView.swift
//  PP
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class Hours3View: UIView {
    
        let data = Model().getPCdata(_3HoursInSec)
        
        override func drawRect(rect: CGRect) {
            
            let GoodPostureValue = CGFloat(data.GPData)/CGFloat(_3HoursInSec/60)*2*π
            let BadPostureValue = CGFloat(data.BPData)/CGFloat(_3HoursInSec/60)*2*π
            let height = bounds.height
            let width = bounds.width
            
            DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
}
