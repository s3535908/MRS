//
//  WeeklyView.swift
//  PP_PieChart
//
//  Created by Mads Svendsen on 21/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class WeeklyView: UIView {

    var HoursOfGoodPosture = CGFloat(Model().PieChartDataGood())
    var HoursOfBadPosture = CGFloat(Model().PieChartDataBad())
    
    override func drawRect(rect: CGRect) {
        let GoodPostureValue = HoursOfGoodPosture/168*2*π
        let BadPostureValue = HoursOfBadPosture/168*2*π
        let height = bounds.height
        let width = bounds.width
        
        DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
}
