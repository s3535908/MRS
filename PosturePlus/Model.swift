//
//  Model.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

class Model {
    
    var AccessToken:String!
    var CoreID:String!
    
    var GSAccessToken:String {
        set (newAccessToken) {
            self.AccessToken = newAccessToken
        }
        get {
            return AccessToken
        }
    }
    
    var GSCoreID:String {
        set (newCoreID) {
            self.CoreID = newCoreID
        }
        get {
            return CoreID
        }
    }
    
    func PieChartDataGood() -> Int {
        let HoursOfGoodPosture:Int = 5
        
        return HoursOfGoodPosture
    }
    
    func PieChartDataBad() -> Int {
        let HoursOfBadPosture:Int = 8
        
        return HoursOfBadPosture
    }
    
    var timer: dispatch_source_t!
    
    func startTimer() {
        let queue = dispatch_queue_create("time", nil)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC, 1 * NSEC_PER_SEC) // every 60 seconds, with leeway of 1 second
        dispatch_source_set_event_handler(timer) {
            self.getData("Posturevalue")
            
            self.getData("Time")
            
        }
        dispatch_resume(timer)
    }
    
    func stopTimer() {
        dispatch_source_cancel(timer)
        timer = nil
    }
    
    
    // Constants for building various url requests to the service
    let DeviceID:String = "51ff72065082554944270887"
    let Accesstoken:String = "09f54420e11539de00c13284f9fec31d3fba410d"
    
    let session = NSURLSession.sharedSession()
    
    
    func getData(Variblename:String){
        
        let dataurl:String = "https://api.spark.io/v1/devices/"+DeviceID+"/"+Variblename+"/?access_token="+Accesstoken
        if let url = NSURL(string: dataurl) {
            let request = NSURLRequest(URL: url)
            initialiseTaskForGettingData(request, element: "results")
        }
    }
    
    func initialiseTaskForGettingData(request: NSURLRequest, element:String)
    {
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            if let error = downloadError
            {
            }
            else
            {
                var parsingError: NSError?
                let parsedResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parsingError)
                //println(parsedResult)
                if let coreData = parsedResult as? NSDictionary {
                    if let VariableVal = (coreData as NSDictionary)["result"] as? Int {
                        if let coreInfo = coreData["coreInfo"] as? NSDictionary {
                            if let deviceID = (coreInfo as NSDictionary)["deviceID"] as? String {
                                println(deviceID)
                                println(VariableVal)
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }
}