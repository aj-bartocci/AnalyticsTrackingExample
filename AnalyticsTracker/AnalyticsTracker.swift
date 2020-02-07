import Foundation

public func combine<Action>(
  _ coordinators: (Action) -> Void...
) -> (Action) -> Void {
  return { action in
    for coordinator in coordinators {
        coordinator(action)
    }
  }
}

public func pullback<LocalAction, GlobalAction>(
  _ coordinator: @escaping (LocalAction) -> Void,
  action: KeyPath<GlobalAction, LocalAction?>
) -> (GlobalAction) -> Void {
    return { globalAction in
        // if the global action can be pulled out of the coordinator
        // we send it on, otherwise we just ignore it
        guard let localAction = globalAction[keyPath: action] else { return }
        coordinator(localAction)
    }
}

public func logging<Action>(
  _ coordinator: @escaping (Action) -> Void
) -> (Action) -> Void {
    return { (action) in
        coordinator(action)
        print("Logged Analytics Event: \(action)")
        print("---")
    }
}

