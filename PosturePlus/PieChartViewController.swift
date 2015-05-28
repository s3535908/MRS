//
//  ViewController.swift
//  PP_PieChart
//
//  Created by Mads Svendsen on 21/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {

    @IBOutlet weak var Hours3View: UIView!
    @IBOutlet weak var DayView: UIView!
    @IBOutlet weak var WeeklyView: UIView!
    @IBOutlet weak var DescriptionView: UIView!
    @IBOutlet weak var lblGoodPosture: UILabel!
    @IBOutlet weak var lblBadPosture: UILabel!
    @IBOutlet weak var lblNotInUse: UILabel!
    @IBOutlet weak var lbl3Hours: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblWeekly: UILabel!
    @IBOutlet weak var bntBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bntBack.setTitleColor(color1, forState: UIControlState.Normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
}

