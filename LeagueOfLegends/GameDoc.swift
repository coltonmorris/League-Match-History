//
//  GameDoc.swift
//  LeagueOfLegends
//
//  Created by Colton Morris on 9/18/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

import Cocoa
import AppKit

class GameDoc: NSObject {
    var data: GameData
    var champImage: NSImage?

    
    override init() {
        self.data = GameData()

    }
    
    init(game: NSDictionary,summonerId: Int, region: String,champImage:NSImage?) {
        
        self.data = GameData(GameDto:game,summonerId: summonerId, region: region )
        self.champImage = champImage
    }
    
}
