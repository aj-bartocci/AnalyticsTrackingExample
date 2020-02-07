import Foundation

public enum AppEvent {
    case appLaunched
    case appEnteredForeground
    case appEnteredBackground
}

struct ProdGoogleTracker {
    static func sendEvent(_ event: String) {
        print("PROD sending google event: \(event)")
        print("---")
    }
}

public let googleAnalyticsTracker: (AppEvent) -> Void = { (event) in
    switch event {
    case .appLaunched:
        Current.send("app_launch")
    case .appEnteredForeground:
        Current.send("app_entered_foreground")
    case .appEnteredBackground:
        Current.send("app_entered_background")
    }
}
