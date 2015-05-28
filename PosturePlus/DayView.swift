//
//  DayView.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class DayView: UIView {
    
    func PCday() {
    
    var HoursOfGoodPosture = CGFloat(Model().PieChartDataGood())
    var HoursOfBadPosture = CGFloat(Model().PieChartDataBad())
    
    func drawRect(rect: CGRect) {
        
        let GoodPostureValue = HoursOfGoodPosture/24*2*π
        let BadPostureValue = HoursOfBadPosture/24*2*π
        let height = bounds.height
        let width = bounds.width
        
        DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
    }
}
