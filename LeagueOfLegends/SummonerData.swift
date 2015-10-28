//
//  SummonerData.swift
//  LeagueOfLegends
//
//  Created by Colton Morris on 9/16/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

import Cocoa

class SummonerData: NSObject {
    var mName: String
    var mId: Double
    
    //constructor
    override init() {
        self.mName = String()
        self.mId = 0.0
    }
    //constructor with name
    init(name:String){
        self.mName = name
        self.mId = 0
    }
    //constructor with id
    init(id:Double){
        self.mId = id
        self.mName = String()
    }
}
//
//  API.swift
//  Hello World
//
//  Created by Colton Morris on 9/16/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

//import Foundation
//
//class Games : NSObject{
//    var gameList: [Summoner]
//    override init(){
//        self.gameList = []
//    }
//    func addRecentGames(summonerName: String){
//        println(summonerName)
//    }
//}
//
//
//
//class SSummoner {
//    var authkey:String = "bcab5026-6ebe-4420-80f7-aaf79cf2ac64"
//    var endpoint:String = "na.api.pvp.net"
//    var region:String = "na"
//    var championUrl:String = "/v1.2/champion"
//    var gameUrl:String = "/v1.3/game/by-summoner"
//    var leagueUrl:String = "/v2.5/league/by-summoner"
//    var summonerUrl:String = "/v1.4/summoner"
//    var staticUrl:String = "/static-data"
//    
//    
//    func getByName(name: String, region: String){
//        
//    }
//    
//    func getChampionList(){
//        
//    }
//    func getSummonerIdByName(){
//        
//    }
//}
