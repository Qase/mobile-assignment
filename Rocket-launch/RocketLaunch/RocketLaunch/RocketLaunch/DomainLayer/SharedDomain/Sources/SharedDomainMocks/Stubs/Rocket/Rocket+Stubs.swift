//
//  Rocket+Stubs.swift
//  
//
//  Created by Tomáš Brand on 01.04.2023.
//

import SharedDomain

public extension Rocket {
    static let stubRocket = Rocket(
        id: "",
        name: "Falcon",
        description: "Rocket short description",
        wikipedia: "",
        active: true,
        stages: 2,
        boosters: 2,
        costPerLaunch: 234,
        successRatePct: 2,
        firstFlight: "2022-02-23 15:00:00",
        country: "",
        company: "",
        flickrImages: [],
        firstStage: RocketFirstStage(
            reusable: true,
            engines: 4,
            fuelAmountTons: 2443,
            burnTimeSec: 12456
        ),
        secondStage: RocketSecondStage(
            reusable: true,
            engines: 67,
            fuelAmountTons: 45567,
            burnTimeSec: 234565
        ),
        height: RocketHeight(meters: 23.5, feet: 14.0),
        diameter: RocketDiameter(meters: 12.2, feet: 39.9),
        mass: RocketMass(kg: 1234, lb: 123)
    )
}
