//
//  GoogleAnalyticsTrackerTests.swift
//  GoogleAnalyticsTrackerTests
//
//  Created by AJ Bartocci on 2/5/20.
//  Copyright © 2020 AJ Bartocci. All rights reserved.
//

import XCTest
@testable import GoogleAnalyticsTracker

class GoogleAnalyticsTrackerTests: XCTestCase {
    
    let sut = googleAnalyticsTracker

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_appLaunchEvent() {
        var receivedEvent: String?
        Current.send = { (event) in
            receivedEvent = event
        }
        sut(.appLaunched)
        XCTAssertEqual(receivedEvent, "app_launch")
    }
    
    func test_appEnteredForeground() {
        var receivedEvent: String?
        Current.send = { (event) in
            receivedEvent = event
        }
        sut(.appEnteredForeground)
        XCTAssertEqual(receivedEvent, "app_entered_foreground")
    }
    
    func test_appEnteredBackground() {
        var receivedEvent: String?
        Current.send = { (event) in
            receivedEvent = event
        }
        sut(.appEnteredBackground)
        XCTAssertEqual(receivedEvent, "app_entered_background")
    }

}
