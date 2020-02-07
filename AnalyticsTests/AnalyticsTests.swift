//
//  AnalyticsTests.swift
//  AnalyticsTests
//
//  Created by AJ Bartocci on 2/5/20.
//  Copyright © 2020 AJ Bartocci. All rights reserved.
//

import XCTest
@testable import Analytics
import FirebaseTracker
import MixpanelTracker
import GoogleAnalyticsTracker

class AnalyticsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        FirebaseTracker.Current = .mock
        MixpanelTracker.Current = .mock
        GoogleAnalyticsTracker.Current = .mock
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_appLaunchEvent() {
        // don't really care about the event details
        // since that is covered by each module's test
        // just want to see that the events we are
        // expecting to fire actually do 
        var didFireFirebaseEvent = false
        FirebaseTracker.Current.sendEvent = { (_, _) in
            didFireFirebaseEvent = true
        }
        var didFireGoogleEvent = false
        GoogleAnalyticsTracker.Current.send = { _ in
            didFireGoogleEvent = true
        }
        Analytics.send(.app(.appLaunched))
        XCTAssert(didFireFirebaseEvent)
        XCTAssert(didFireGoogleEvent)
    }

    /*
     
     ... would do full testing in real app 
     
     */
}
