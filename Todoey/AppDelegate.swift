//
//  AppDelegate.swift
//  Todoey
//
//  Created by Chris Abbod on 12/21/18.
//  Copyright © 2018 Chris Abbod. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Location of the realm file for testing
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        //Setup a Realm database object and write our data to it
        do {
            _ = try Realm()
            
        } catch {
            print("Error initializing new realm \(error)")
        }
        
        return true
    }

}

