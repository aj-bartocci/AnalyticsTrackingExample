import Foundation

public enum UserEvent {
    case loggedIn(userId: String)
    case loggedOut
}

struct ProdMixpanelTracker {
    
    static func send(_ event: UserEvent) {
        switch event {
        case .loggedIn(userId: let userId):
            sendLoginEvent(userId: userId)
        case .loggedOut:
            sendLogoutEvent()
        }
    }
    
    static func sendLoginEvent(userId: String) {
        print("PROD mixpanel sendLoginEvent userId: \(userId)")
        print("---")
    }
    
    static func sendLogoutEvent() {
        print("PROD mixpanel sendLogoutEvent")
        print("---")
    }
}

public struct UserEventEnvironment {
    public var sendLoginEvent: (String) -> Void
    public var sendLogoutEvent: () -> Void
}

public struct Environment {
    public var sendUserEvent: (UserEvent) -> Void
}

extension Environment {
    static let live = Environment(sendUserEvent: { (event) in
        ProdMixpanelTracker.send(event)
    })
}

#if DEBUG
public extension Environment {
    static let mock = Environment(sendUserEvent: { (_) in
        // do nothing
    })
}
public var Current = Environment.mock
#else
public let Current = Environment.live
#endif

public let mixpanelTracker: (UserEvent) -> Void = { (event) in
    Current.sendUserEvent(event)
}
