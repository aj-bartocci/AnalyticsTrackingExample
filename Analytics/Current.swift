//
//  Current.swift
//  Analytics
//
//  Created by AJ Bartocci on 2/7/20.
//  Copyright © 2020 AJ Bartocci. All rights reserved.
//

import Foundation

struct Environment {
    struct AnalyticsTracker {
        var send: (AnalyticsEvent) -> Void
    }
    var analytics: AnalyticsTracker
}

extension Environment {
    static let live = Environment(
        analytics: AnalyticsTracker(send: Analytics.send)
    )
}

#if DEBUG
var Current = Environment.live
#else
let Current = Environment.live
#endif
