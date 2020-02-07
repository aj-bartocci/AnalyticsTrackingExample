import Foundation
import GoogleAnalyticsTracker
import MixpanelTracker

public enum APIErrorEvent {
    case unexpectedResponse(endpoint: String)
    case timeout(endpoint: String)
}

// intermediate enum to combine the two enums we want
public enum FirebaseEvent {
    case api(APIErrorEvent)
    case app(AppEvent)
}

private struct ProdFirebaseTracker {
    static func send(event: String, info: [String: String]) {
        // hit the prod tracking stuff
        print("PROD send firebase event: \(event), info: \(info)")
        print("---")
    }
}

public struct Environment {
    public var sendEvent: (_ event: String, _ info: [String: String]) -> Void
}

extension Environment {
    static let live = Environment { (event, info) in
        ProdFirebaseTracker.send(event: event, info: info)
    }
}
#if DEBUG
public extension Environment {
    static let mock = Environment { (_, _) in
        // do nothing
    }
}
public var Current = Environment.mock
#else
public let Current = Environment.live
#endif

public let firebaseAppEventTracker: (AppEvent) -> Void = { event in
    switch event {
    case .appLaunched:
        Current.sendEvent("app_launch", [:])
    case .appEnteredForeground:
        Current.sendEvent("app_entered_foreground", [:])
    case .appEnteredBackground:
        Current.sendEvent("app_entered_background", [:])
    }
}

public let firebaseAPIErrorTracker: (APIErrorEvent) -> Void = { (event) in
    switch event {
    case .unexpectedResponse(endpoint: let endpoint):
        Current.sendEvent("unexpected_response", ["endpoint": endpoint])
    case .timeout(endpoint: let endpoint):
        Current.sendEvent("response_timeout", ["endpoint": endpoint])
    }
}

//public let firebaseUserTracker: (UserEvent) -> Void = { (event) in
//    switch event {
//    case .loggedIn(userId: let userId):
//        Current.sendEvent("user_loggedin", ["user_id": userId])
//    case .loggedOut:
//        Current.sendEvent("user_logout", [:])
//    }
//}
