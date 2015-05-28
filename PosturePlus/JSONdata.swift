//
//  JSONdata.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 28/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

class JSONdata {
    
    let session = NSURLSession.sharedSession()
    
    //Sends a request to the URL to receive JSON data.
    func getData(Variblename:String, completionHandler: (result:Bool!) -> Void)
    {
        let dataurl:String = "https://api.spark.io/v1/devices/"+UniCoreID+"/"+Variblename+"/?access_token="+UniAccessToken
        if let url = NSURL(string: dataurl) {
            let request = NSURLRequest(URL: url)
            initialiseTaskForGettingData(request, element: "results", completionHandler: { (result) -> Void in
                if (result == true) {
                    completionHandler(result: true)
                }
                else {
                    completionHandler(result: false)
                }
            })
        }
    }
    
    //Handles the JSON data. Get the DeviceID and Variblevalue (Posture Value and Time value)
    func initialiseTaskForGettingData(request: NSURLRequest, element:String, completionHandler: (result:Bool!) -> Void)
    {
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            if let error = downloadError
            {
                completionHandler(result: false)
            }
            else
            {
                var parsingError: NSError?
                let parsedResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parsingError)
                if let coreData = parsedResult as? NSDictionary {
                    if let VariableVal = (coreData as NSDictionary)["result"] as? Int {
                        if let coreInfo = coreData["coreInfo"] as? NSDictionary {
                            if let deviceID = (coreInfo as NSDictionary)["deviceID"] as? String {
                                println(deviceID)
                                println(VariableVal)
                                ValHolder = VariableVal
                                completionHandler(result: true)
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }
}