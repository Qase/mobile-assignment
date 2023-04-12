//
//  UseCases+Injection.swift
//  RocketLaunch
//
//  Created by Tomáš Brand on 13.03.2023.
//

import Resolver
import SharedDomain

public extension Resolver {
    static func registerUseCases() {
        // Rockets
        register { GetRocketsUseCaseImpl(rocketsRepository: resolve()) as GetRocketsUseCase }
        register { GetRocketUseCaseImpl(rocketsRepository: resolve()) as GetRocketUseCase }
    }
}

