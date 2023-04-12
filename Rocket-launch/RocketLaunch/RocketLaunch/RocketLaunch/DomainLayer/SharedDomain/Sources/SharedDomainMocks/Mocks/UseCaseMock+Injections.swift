//
//  UseCaseMock+Injections.swift
//  
//
//  Created by Tomáš Brand on 01.04.2023.
//

import Resolver
import SharedDomain

public extension Resolver {
    static func registerUseCaseMocks() {
        // Rocket
        register { GetRocketsUseCaseMock() as GetRocketsUseCase }
        register { GetRocketUseCaseMock() as GetRocketUseCase }
    }
}

