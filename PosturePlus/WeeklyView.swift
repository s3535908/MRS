//
//  WeeklyView.swift
//  PP_PieChart
//
//  Created by Mads Svendsen on 21/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class WeeklyView: UIView {

    let data = Model().getPCdata(WeekInSec)
    
    override func drawRect(rect: CGRect) {
        
        var HoursOfGoodPosture = CGFloat(data.GPData)
        var HoursOfBadPosture = CGFloat(data.BPData)
        
        let GoodPostureValue = HoursOfGoodPosture/60*2*π
        let BadPostureValue = HoursOfBadPosture/60*2*π
        println(GoodPostureValue)
        println(BadPostureValue)
        let height = bounds.height
        let width = bounds.width
        
        DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
}
