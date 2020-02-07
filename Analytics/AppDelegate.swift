//
//  AppDelegate.swift
//  Analytics
//
//  Created by AJ Bartocci on 2/5/20.
//  Copyright © 2020 AJ Bartocci. All rights reserved.
//

import UIKit
import GoogleAnalyticsTracker
import AnalyticsTracker

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // here we wrap the send function in logging
        // if we try to make a release build this will be
        // caught by the compiler telling us to remove it 
        Current.analytics.send = logging(Current.analytics.send)
        
        // We could also adjust the environments in different ways for debugging as well
//        Current.analytics.send = { (event) in
//            print("DEBUG analytics: \(event)")
//        }
        // we can make specific trackers live if we want to test out the release functionality
//        GoogleAnalyticsTracker.Current = .live

        Current.analytics.send(.app(.appLaunched))
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

