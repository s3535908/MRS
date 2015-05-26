//
//  Model.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

class Model {
    
    //Get/Set functions to pass AccessToken and CoreID from CoreInfoView to the Model.
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
        let queue = dispatch_queue_create("que", nil)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC, 1 * NSEC_PER_SEC)
        dispatch_source_set_event_handler(timer) {
            self.getData("Posturevalue")
            self.getData("Time")
        }
        dispatch_resume(timer)
    }
    
    //Stops the timer.
    func stopTimer() {
        dispatch_source_cancel(timer)
        timer = nil
    }
    
    
    // Temporary constants to compose the URL. Has to be replaced with the values passed on from the CoreInfoView.
    let DeviceID:String = "51ff72065082554944270887"
    let Accesstoken:String = "09f54420e11539de00c13284f9fec31d3fba410d"
    
    let session = NSURLSession.sharedSession()
    
    //Sends a request to the URL to receive JSON data.
    func getData(Variblename:String){
        
        let dataurl:String = "https://api.spark.io/v1/devices/"+DeviceID+"/"+Variblename+"/?access_token="+Accesstoken
        if let url = NSURL(string: dataurl) {
            let request = NSURLRequest(URL: url)
            initialiseTaskForGettingData(request, element: "results")
        }
    }
    
    //Handles the JSON data. Get the DeviceID and Variblevaue (Posturevalue or Time value)
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