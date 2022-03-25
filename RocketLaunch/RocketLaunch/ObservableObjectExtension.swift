//
//  ObservableObjectExtension.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.03.2022.
//

import Foundation

// MARK: - Loadable Object
protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
