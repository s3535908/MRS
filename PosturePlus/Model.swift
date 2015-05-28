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
    

    func PieChartDataGood() -> Int {
        let HoursOfGoodPosture:Int = 5
        
        return HoursOfGoodPosture
    }
    
    func PieChartDataBad() -> Int {
        let HoursOfBadPosture:Int = 8
        
        return HoursOfBadPosture
    }
    
    func getPCdata(time:Double) -> (GPData:Int, BPData:Int){
        let GPData:Int!
        let BPData:Int!
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Data")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "coreid = %@", UniCoreID)
        
        let TimeRange:Double = NSDate().timeIntervalSince1970-time

        let TimePredicate = NSPredicate(format: "time >= \(TimeRange) ")
        let GPPredicate = NSPredicate(format: "postureval = 1")
        let BPPredicate = NSPredicate(format: "postureval = 2")
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!

        results = results.filteredArrayUsingPredicate(TimePredicate)
        var GPresults:NSArray = results.filteredArrayUsingPredicate(GPPredicate)
        var BPresults:NSArray = results.filteredArrayUsingPredicate(BPPredicate)

        if(GPresults.count > 0){
            println(GPresults.count)
            println("Good Posture")
            GPData = GPresults.count;
        }
        else {
            GPData = 0
        }
        
        if(BPresults.count > 0){
            println(BPresults.count)
            println("Bad Posture")
            BPData = BPresults.count;
        }
        else {
            BPData = 0;
        }
        return (GPData, BPData)
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
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newData = NSEntityDescription.insertNewObjectForEntityForName("Data", inManagedObjectContext: context) as! NSManagedObject
        newData.setValue(Time, forKey: "time")
        newData.setPrimitiveValue(PostureVal, forKey: "postureval")
        newData.setPrimitiveValue(UniCoreID, forKey: "coreid")
        context.save(nil)
        println(newData)
    }
}
