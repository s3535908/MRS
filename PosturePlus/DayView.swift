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
        
        var HoursOfGoodPosture = CGFloat(data.GPData)
        var HoursOfBadPosture = CGFloat(data.BPData)
        
        let GoodPostureValue = HoursOfGoodPosture/30*2*π
        let BadPostureValue = HoursOfBadPosture/30*2*π
        println(GoodPostureValue)
        println(BadPostureValue)
        let height = bounds.height
        let width = bounds.width
        
        DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
}
