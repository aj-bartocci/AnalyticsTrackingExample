import AnalyticsTracker
import GoogleAnalyticsTracker
import FirebaseTracker
import Foundation
import MixpanelTracker

enum AnalyticsEvent {
    case app(AppEvent)
    case api(APIErrorEvent)
    case user(UserEvent)
}

extension AnalyticsEvent {
    // boilerplate to get keypaths for our AnalyticsEvent enum
    // this is the one downside to this approach but I think
    // it is worth it in the end
    var app: AppEvent? {
      get {
        guard case let .app(value) = self else { return nil }
        return value
      }
    }
    var api: APIErrorEvent? {
      get {
        guard case let .api(value) = self else { return nil }
        return value
      }
    }
    var user: UserEvent? {
      get {
        guard case let .user(value) = self else { return nil }
        return value
      }
    }
}

struct Analytics {
    // composable send function,
    // we could even log only specific things by doing
    // logging(pullback(firebaseAppEventTracker, action: \.app))
    static let send: (AnalyticsEvent) -> Void = combine(
        pullback(googleAnalyticsTracker, action: \.app),
        pullback(firebaseAppEventTracker, action: \.app),
        pullback(firebaseAPIErrorTracker, action: \.api),
        pullback(mixpanelTracker, action: \.user)
    )
}
