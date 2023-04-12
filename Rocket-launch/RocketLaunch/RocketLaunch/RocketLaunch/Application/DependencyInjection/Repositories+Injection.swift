//
//  Repositories+Injection.swift
//  RocketLaunch
//
//  Created by Tomáš Brand on 13.03.2023.
//

import Resolver
import SharedDomain
import RocketsToolkit

public extension Resolver {
    static func registerRepositories() {
        register { RocketsRepositoryImpl(networkProvider: resolve()) as RocketsRepository }
    }
}
