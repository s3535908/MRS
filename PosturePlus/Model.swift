//
//  Model.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Model {
    
    //Temporary functions to provide a value for the PieCharts. Has to be replaced with methods that computes values based on the Time and Posturevalue from the API call saved as CoreData.
    func PieChartDataGood() -> Int {
        let HoursOfGoodPosture:Int = 5
        
        return HoursOfGoodPosture
    }
    
    func PieChartDataBad() -> Int {
        let HoursOfBadPosture:Int = 8
        
        return HoursOfBadPosture
    }
    
    
    var timer: dispatch_source_t!
    
    //Calls the getData function twice every 60 seconds. First to get the Posturevalue and then to get the Time value.
    func startTimer() {
        let queue = dispatch_queue_create("com.que", nil)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC, 1 * NSEC_PER_SEC)
        dispatch_source_set_event_handler(timer) {
            var Time:Int!
            var Posturevalue:Int!
            var CoreID:String!
            JSONdata().getData("Posturevalue", completionHandler: { (result) -> Void in
                if (result == true) {
                Posturevalue = ValHolder
                    JSONdata().getData("Time",  completionHandler: { (result) -> Void in
                        if (result == true) {
                            Time = ValHolder
                            self.saveCoreData(Time, PostureVal: Posturevalue)
                        }
                    })

                }
            })
        }
        dispatch_resume(timer)
    }
    
    //Stops the timer.
    func stopTimer() {
        dispatch_source_cancel(timer)
        timer = nil
    }
    
    func saveCoreData(Time:Int, PostureVal:Int) {
        print(Time)
        print(PostureVal)
        print(UniCoreID)
        println()
        
//        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
//        var context:NSManagedObjectContext = appDel.managedObjectContext!
//        var request = NSFetchRequest(entityName: "Coredata")
//        request.returnsObjectsAsFaults = false
//        
//        var newData = NSEntityDescription.insertNewObjectForEntityForName("Coredata", inManagedObjectContext: context) as! NSManagedObject
//        newData.setValue(Time, forKey: "time")
//        context.save(nil)
//        println(newData)
    }
}
