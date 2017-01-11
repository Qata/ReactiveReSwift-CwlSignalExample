import ReactiveReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives
let counterReducer = Reducer<AppState> { action, state in
    var state = state
    switch action as? AppAction {
    case .increase?:
        state.counter += 1
    case .decrease?:
        state.counter -= 1
    default:
        break
    }
    return state
}
