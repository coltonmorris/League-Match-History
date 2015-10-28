//
//  AppDelegate.swift
//  LeagueOfLegends
//
//  Created by Colton Morris on 9/16/15.
//  Copyright (c) 2015 Colton Morris. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var masterViewController: MasterViewController!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        masterViewController = MasterViewController(nibName: "MasterViewController", bundle: nil)
        
        masterViewController.setupSampleGames()
        
        window.contentView.addSubview(masterViewController.view)
        masterViewController.view.frame = (window.contentView as! NSView).bounds
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

