import XCTest
@testable import FirebaseTracker

class FirebaseTrackerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Current = .mock
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_appLaunchEvent() {
        var receivedEvent: String?
        var receivedInfo: [String: String]?
        Current.sendEvent = { (event, info) in
            receivedEvent = event
            receivedInfo = info
        }
        firebaseAppEventTracker(.appLaunched)
        XCTAssertEqual(receivedEvent, "app_launch")
        XCTAssertEqual(receivedInfo, [:])
    }
    
    func test_appEnteredForeground() {
        var receivedEvent: String?
        var receivedInfo: [String: String]?
        Current.sendEvent = { (event, info) in
            receivedEvent = event
            receivedInfo = info
        }
        firebaseAppEventTracker(.appEnteredForeground)
        XCTAssertEqual(receivedEvent, "app_entered_foreground")
        XCTAssertEqual(receivedInfo, [:])
    }
    
    func test_appEnteredBackground() {
        var receivedEvent: String?
        var receivedInfo: [String: String]?
        Current.sendEvent = { (event, info) in
            receivedEvent = event
            receivedInfo = info
        }
        firebaseAppEventTracker(.appEnteredBackground)
        XCTAssertEqual(receivedEvent, "app_entered_background")
        XCTAssertEqual(receivedInfo, [:])
    }
    
    func test_unexpectedResponse() {
        var receivedEvent: String?
        var receivedInfo: [String: String]?
        Current.sendEvent = { (event, info) in
            receivedEvent = event
            receivedInfo = info
        }
        let endpoint = "some-endpoint"
        firebaseAPIErrorTracker(.unexpectedResponse(endpoint: endpoint))
        XCTAssertEqual(receivedEvent, "unexpected_response")
        XCTAssertEqual(receivedInfo, ["endpoint": endpoint])
    }
    
    func test_responseTimeout() {
        var receivedEvent: String?
        var receivedInfo: [String: String]?
        Current.sendEvent = { (event, info) in
            receivedEvent = event
            receivedInfo = info
        }
        let endpoint = "some-other-endpoint"
        firebaseAPIErrorTracker(.timeout(endpoint: endpoint))
        XCTAssertEqual(receivedEvent, "response_timeout")
        XCTAssertEqual(receivedInfo, ["endpoint": endpoint])
    }
}
