//
//  SummonerDoc.swift
//  LeagueOfLegends
//
//  Created by Colton Morris on 9/16/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

import Foundation
import AppKit

class SummonerDoc: NSObject {
    var data: SummonerData
    //var thumbImage: NSImage?
    //var fullImage: NSImage?
    
    override init() {
        self.data = SummonerData()
    }
    
    init(name: String){
        self.data = SummonerData(name: name)
    }
}

