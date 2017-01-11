//
//  ReactiveReSwiftBridge.swift
//  ReactiveReSwift-CwlSignalExample
//
//  Created by Charlotte Tortorella on 11/1/17.
//  Copyright © 2017 ReSwift. All rights reserved.
//

import ReactiveReSwift
import CwlSignal

extension Signal: StreamType {
    public typealias ValueType = T
    public typealias DisposableType = DisposableWrapper<T>

    public func subscribe(_ function: @escaping (T) -> Void) -> DisposableWrapper<T>? {
        return DisposableWrapper(disposable: subscribeValues(handler: function))
    }
}

public struct DisposableWrapper<T>: SubscriptionReferenceType {
    let disposable: SignalEndpoint<T>
    
    public func dispose() {
        disposable.cancel()
    }
}

extension ObservableProperty {
    func signal() -> Signal<ValueType> {
        let (input, signal) = Signal<ValueType>.create()
        let disposable = subscribe { input.send(value: $0) }
        return signal.onDeactivate {
            disposable?.dispose()
        }
    }
}
