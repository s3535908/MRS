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
            println(AccessToken)
        }
        get {
            return AccessToken
        }
    }
    
    var GSCoreID:String {
        set (newCoreID) {
            self.CoreID = newCoreID
            println(CoreID)
        }
        get {
            return CoreID
        }
    }
}