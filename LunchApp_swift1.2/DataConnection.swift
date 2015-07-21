//
//  DataConnection.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/06.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import Alamofire
//import SwiftyJSON

class DataConnection:NSObject {
    var loadedData:AnyObject?

    func connection() {
        var url     = NSURL(string: "http://localhost:28017/test/shopinfos/")
        var request = NSURLRequest(URL: url!)
        
        Alamofire.request(.GET, url!, parameters:nil, encoding:.JSON).responseJSON(options: nil, completionHandler: {(request,response,data,error) in
            if error != nil{
                println("database error:\(error)")
            }else{
                println("database success")
                NSNotificationCenter.defaultCenter().postNotificationName("dataLoaded", object: nil, userInfo: ["loadedData":data!])
                self.loadedData = data!
            }
        })
    }
    
}