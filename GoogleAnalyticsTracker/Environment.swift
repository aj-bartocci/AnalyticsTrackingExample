//
//  Environment.swift
//  GoogleAnalyticsTracker
//
//  Created by AJ Bartocci on 2/7/20.
//  Copyright © 2020 AJ Bartocci. All rights reserved.
//

import Foundation

public struct Environment {
    public var send: (String) -> Void
}

extension Environment {
    public static let live = Environment { (event) in
        ProdGoogleTracker.sendEvent(event)
    }
}

#if DEBUG
extension Environment {
    public static let mock = Environment { (_) in
        // do nothing
    }
}
public var Current = Environment.mock
#else
public let Current = Environment.live
#endif
