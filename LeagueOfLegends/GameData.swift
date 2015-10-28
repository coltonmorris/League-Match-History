//
//  GameData.swift
//  LeagueOfLegends
//
//  Created by Colton Morris on 9/16/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

import Cocoa

class GameData:NSObject {
    //Data for easy access
    var summonerId: Int
    var region: String
    //Dictionary that stores all game data
    var GameDto: NSDictionary
    
    //constructor
    override init() {
        self.summonerId = 0
        self.region = "na"
        self.GameDto = NSDictionary()

    }
    init(GameDto:NSDictionary,summonerId:Int,region:String){
        self.summonerId = summonerId
        self.region = region

        self.GameDto = GameDto

    }
}
