//
//  DayView.swift
//  PP
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class Hours3View: UIView {
    
    func PC3hours(){
    let time:Double = 10800
        let data:Int = Model.getPCdata()
    var HoursOfGoodPosture = CGFloat(data.GPData)
    var HoursOfBadPosture = CGFloat(data.BPData)
    }
        override func drawRect(rect: CGRect) {
            
            let GoodPostureValue = HoursOfGoodPosture/3*2*π
            let BadPostureValue = HoursOfBadPosture/3*2*π
            let height = bounds.height
            let width = bounds.width
            
            DrawPieChart().DrawPC(GoodPostureValue, BadPostureValue: BadPostureValue, Height: height, Width: width)
    }
}
