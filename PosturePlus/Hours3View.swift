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
            
            var HoursOfGoodPosture = CGFloat(data.GPData)
            var HoursOfBadPosture = CGFloat(data.BPData)
            
            let GoodPostureValue = HoursOfGoodPosture/15*2*π
            let BadPostureValue = HoursOfBadPosture/15*2*π
            println(GoodPostureValue)
            println(BadPostureValue)
            let height = bounds.height
            let width = bounds.width
            
            DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
}
