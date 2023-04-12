//
//  RocketStage+Stubs.swift
//  
//
//  Created by Tomáš Brand on 01.04.2023.
//

import SharedDomain

public extension RocketStage {
    public static let stubRocketStage = RocketStage(
        reusable: true,
        engines: 4,
        fuelAmountTons: 2443,
        burnTimeSec: 12456,
        isFirstStage: true
    )
}
