//
//  File.swift
//  LeagueOfLegends
//
//  Created by Colton Morris on 9/28/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

import Foundation

func getAPI(){
    //https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/RiotSchmick?api_key=<key>
    var endpoint: String = "https://na.api.pvp.net"
    //"/api/lol/{region}/v1.3/game/by-summoner/{summonerId}/recent"
    var apiRequest: String = "/api/lol/na/v1.3/game/by-summoner/38918850/recent"
    var key: String = "?api_key=bcab5026-6ebe-4420-80f7-aaf79cf2ac64"
    var url: String = endpoint+apiRequest+key
    var request : NSMutableURLRequest = NSMutableURLRequest()
    request.URL = NSURL(string: url)
    request.HTTPMethod = "GET"
    
    //must be xcode 7 or whatever, just not the beta
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
        let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
        
        if (jsonResult != nil) {
            // process jsonResult
            println(jsonResult)
            
        } else {
            // couldn't load JSON, look at error
        }
        
        
    })
}