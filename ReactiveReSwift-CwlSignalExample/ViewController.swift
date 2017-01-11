//
//  ViewController.swift
//  ReactiveReSwift-CwlSignalExample
//
//  Created by Charlotte Tortorella on 11/1/17.
//  Copyright © 2017 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import CwlSignal

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    let disposeBag = SubscriptionReferenceBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disposeBag += mainStore.observable.subscribe { [weak self] store in
            self?.counterLabel.text = String(store.counter)
        }
    }
    
    // when either button is tapped, an action is dispatched to the store
    // in order to update the application state
    @IBAction func downTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch signals directly,
        // don't actually do this, this is bad code
        let (input, signal) = Signal<AppAction>.create()
        mainStore.dispatch(signal)
        input.send(value: AppAction.decrease)
        input.close()
    }
    
    @IBAction func upTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch signals directly,
        // don't actually do this, this is bad code
        let (input, signal) = Signal<AppAction>.create()
        mainStore.dispatch(signal)
        input.send(value: AppAction.increase)
        input.close()
    }
}
