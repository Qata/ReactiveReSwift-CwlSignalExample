//
//  AppDelegate.swift
//  ReactiveReSwift-CwlSignalExample
//
//  Created by Charlotte Tortorella on 11/1/17.
//  Copyright © 2017 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift

let middleware = Middleware<AppState>().sideEffect { _, _, action in
    print("Received action:")
}.sideEffect { _, _, action in
    print(action)
}

// The global application store, which is responsible for managing the appliction state.
let mainStore = Store(
    reducer: counterReducer,
    observable: ObservableProperty(AppState()),
    middleware: middleware
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
}
