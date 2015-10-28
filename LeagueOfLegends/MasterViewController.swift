//
//  MasterViewController.swift
//  LeagueOfLegends
//
//  Created by Colton Morris on 9/16/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

import Cocoa

class MasterViewController: NSViewController {
    var Games = [GameDoc]()
    var Summoner = SummonerDoc()

    @IBOutlet weak var summonerNameTitle: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    //gather our game info by making multiple api calls
    func setupSampleGames(){
        //check if input value is acceptable
        if self.summonerNameTitle == nil || self.summonerNameTitle.stringValue == "" {
            println("not calling api")
            return
        }
        //delete our current game list
        Games.removeAll()
        //remove whitespace from name
        self.summonerNameTitle.stringValue = self.summonerNameTitle.stringValue.stringByReplacingOccurrencesOfString(" ", withString: "")
        
        println("calling api")
        
        //get our summoner id for future api calls
        var connection = APIConnection()
        let summonerId = connection.summonerIdByName(self.summonerNameTitle.stringValue)
        //check for errors
        if summonerId == -1 {
            return
        }

        //get our recent games
        var jsonResult = connection.recentGames(summonerId)
        let games = jsonResult["games"] as! NSArray
        
        //create GameDoc objects from our GameData List
        for (index,game) in enumerate(games) {
            //get champion static data
            var champId: String = games[index]["championId"]!!.stringValue
            jsonResult = connection.championData(champId)
            
            let champName: String = jsonResult["key"]! as! String
            var champImage: String = champName + "_Square_0"

            //add game to our list
            let tmpGame = GameDoc(game:games[index] as! NSDictionary,summonerId:summonerId,region:"na",
                champImage:NSImage(named: champImage))
            Games.append(tmpGame)
        }
        //update table view
        self.tableView.reloadData()
    }
}

// MARK: - IBActions
extension MasterViewController {
    
    @IBAction func summonerNameDidEndEdit(sender: AnyObject) {
        self.setupSampleGames()
    }
}

// MARK: - NSTableViewDataSource
extension MasterViewController: NSTableViewDataSource {
    //func to know how many rows to display
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
        return self.Games.count
    }
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
               // 1
        let cellView: myNSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! myNSTableCellView
        //cellView.contentView.backgroundColor = UIColor.redColor()
//        var red = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        var gree: NSColor = NSColor.greenColor()
        
        cellView.layer?.backgroundColor = gree.CGColor
        
        
        // 2
        if tableColumn!.identifier == "GameColumn" {
            // 3
            let GameDoc = self.Games[row]

            var ourdict: [String : String]! = [ "championsKilled":"0" , "assists":"0" , "numDeaths":"0",
                "win":"IDK", "wardPlaced":"0", "minionsKilled":"0"]
            
            for (key,value) in ourdict {
                if (GameDoc.data.GameDto["stats"]![key]! != nil) {
                    ourdict[key] = GameDoc.data.GameDto["stats"]![key]!!.stringValue
                }
            }
            var str = ourdict["championsKilled"]! + "/" + ourdict["numDeaths"]! + "/" + ourdict["assists"]!
            cellView.textField!.stringValue = str
            cellView.imageView!.image = GameDoc.champImage
            
            //find kda
            var kda: Float = (ourdict["championsKilled"]! as NSString).floatValue
            kda += (ourdict["assists"]! as NSString).floatValue
            kda /= (ourdict["numDeaths"]! as NSString).floatValue

            cellView.t1.stringValue = String(format: "%.2f", kda) + " KDA"
//            ourdict["win"]!. == "0" ? cellView.t2.stringValue = "Victory" : cellView.t2.stringValue = "Defeat"
            cellView.t2.stringValue = "Victory"
            if ourdict["win"]! == "0" {
                cellView.t2.stringValue = "Defeat"
            }
            cellView.t3.stringValue = ourdict["wardPlaced"]!
            cellView.t4.stringValue = ourdict["minionsKilled"]!
            
            
            return cellView
        }
        
        return cellView
    }
}

// MARK: - NSTableViewDelegate
extension MasterViewController: NSTableViewDelegate {
}