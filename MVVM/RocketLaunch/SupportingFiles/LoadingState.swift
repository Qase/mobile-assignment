//
//  LoadingState.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.03.2022.
//

import Foundation

// MARK: Loading State

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
