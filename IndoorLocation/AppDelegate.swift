//
//  AppDelegate.swift
//  IndoorLocation
//
//  Created by KL on 23/04/2019.
//  Copyright © 2019 KL. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let locationBuilder = EILLocationBuilder()
        
        locationBuilder.setLocationName("CGHworkroom")
        
        locationBuilder.setLocationBoundaryPoints([
            EILPoint(x: 0.00, y: 0.00),
            EILPoint(x: 5.21, y: 0.00),
            EILPoint(x: 5.21, y: 7.60),
            EILPoint(x: 0.00, y: 7.60)])

        locationBuilder.addBeacon(withIdentifier: "4bacde09e3107e737aad543c3343a615",
                                  atBoundarySegmentIndex: 0, inDistance: 2.6, from: .leftSide) //beetroot2
        locationBuilder.addBeacon(withIdentifier: "04e08c076be759a663a16c13a03b1a3f",
                                  atBoundarySegmentIndex: 3, inDistance: 1.8, from: .leftSide) //lemon2
        locationBuilder.addBeacon(withIdentifier: "47c9b564dc72a2a37b522ff06007a819",
                                  atBoundarySegmentIndex: 3, inDistance: 2.1, from: .rightSide) //candy2
        locationBuilder.addBeacon(withIdentifier: "16e51a654b9bc1e6e0ebd27799068801",
                                  atBoundarySegmentIndex: 2, inDistance: 2.3, from: .leftSide) //lemon
        locationBuilder.addBeacon(withIdentifier: "3526e3829fcb88d3a650dd45e6132620",
                                  atBoundarySegmentIndex: 1, inDistance: 1.4, from: .leftSide) //beetroot
        locationBuilder.addBeacon(withIdentifier: "22cc34c909bba596a42d5b4758c7ec3a",
                                  atBoundarySegmentIndex: 1, inDistance: 4.5, from: .leftSide) //candy
        locationBuilder.addBeacon(withIdentifier: "834ce436c0ac8310e090f5afb323ea22",
                                  atBoundarySegmentIndex: 1, inDistance: 0.3, from: .rightSide) //coconut2
        
        locationBuilder.setLocationOrientation(252)
        
        
        let location = locationBuilder.build()
        
        ESTConfig.setupAppID("cgh-map-test-ns0", andAppToken: "8aadb34122c354cff41f3c7c821fffeb")
        let addLocationRequest = EILRequestAddLocation(location: location!)
        addLocationRequest.sendRequest { (location, error) in
            if error != nil {
                NSLog("Error when saving location: \(String(describing: error))")
            } else {
                NSLog("Location saved successfully: \(String(describing: location?.identifier))")
            }}
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

