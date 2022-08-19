//
//  LoadingState.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.03.2022.
//

import Foundation

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
