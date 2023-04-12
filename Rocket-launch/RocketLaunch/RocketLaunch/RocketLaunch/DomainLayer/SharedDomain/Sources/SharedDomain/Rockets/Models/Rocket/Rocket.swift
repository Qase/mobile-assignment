//
//  Rocket.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import Foundation

public struct Rocket: Equatable, Hashable {
    public let id: String
    public let name: String
    public let description: String
    public let wikipedia: String
    public let active: Bool
    public let stages: Int
    public let boosters: Int
    public let costPerLaunch: Int
    public let successRatePct: Int
    public let firstFlight: String
    public let country: String
    public let company: String
    public let flickrImages: [String]
    public let firstStage: RocketFirstStage?
    public let secondStage: RocketSecondStage?
    public let height: RocketHeight?
    public let diameter: RocketDiameter?
    public let mass: RocketMass?
    
    public init(
        id: String,
        name: String,
        description: String,
        wikipedia: String,
        active: Bool,
        stages: Int,
        boosters: Int,
        costPerLaunch: Int,
        successRatePct: Int,
        firstFlight: String,
        country: String,
        company: String,
        flickrImages: [String],
        firstStage: RocketFirstStage?,
        secondStage: RocketSecondStage?,
        height: RocketHeight?,
        diameter: RocketDiameter?,
        mass: RocketMass?
    ) {
        self.id = id
        self.name = name
        self.active = active
        self.description = description
        self.wikipedia = wikipedia
        self.stages = stages
        self.boosters = boosters
        self.costPerLaunch = costPerLaunch
        self.successRatePct = successRatePct
        self.firstFlight = firstFlight
        self.country = country
        self.company = company
        self.flickrImages = flickrImages
        self.firstStage = firstStage
        self.secondStage = secondStage
        self.height = height
        self.diameter = diameter
        self.mass = mass
    }
}

// Copy constructor
public extension Rocket {
    init(
        copy: Rocket,
        id: String? = nil,
        name: String? = nil,
        description: String? = nil,
        wikipedia: String? = nil,
        active: Bool? = nil,
        stages: Int? = nil,
        boosters: Int? = nil,
        costPerLaunch: Int? = nil,
        successRatePct: Int? = nil,
        firstFlight: String? = nil,
        country: String? = nil,
        company: String? = nil,
        flickrImages: [String]? = nil,
        firstStage: RocketFirstStage? = nil,
        secondStage: RocketSecondStage? = nil,
        height: RocketHeight? = nil,
        diameter: RocketDiameter? = nil,
        mass: RocketMass? = nil
    ) {
        self.id = id ?? copy.id
        self.name = name ?? copy.name
        self.description = description ?? copy.description
        self.wikipedia = wikipedia ?? copy.wikipedia
        self.active = active ?? copy.active
        self.stages = stages ?? copy.stages
        self.boosters = boosters ?? copy.boosters
        self.costPerLaunch = costPerLaunch ?? copy.costPerLaunch
        self.successRatePct = successRatePct ?? copy.successRatePct
        self.firstFlight = firstFlight ?? copy.firstFlight
        self.country = country ?? copy.country
        self.company = company ?? copy.company
        self.flickrImages = flickrImages ?? copy.flickrImages
        self.firstStage = firstStage ?? copy.firstStage
        self.secondStage = secondStage ?? copy.secondStage
        self.height = height ?? copy.height
        self.diameter = diameter ?? copy.diameter
        self.mass = mass ?? copy.mass
    }
}

// MARK: - Mass formatting

public extension Rocket {
    var formattedMetersHeight: String {
        let meters = Measurement(value: height?.meters ?? 0, unit: UnitLength.meters)
        return String(format: "%.0f", meters.value.rounded()) + "m"
    }
    
    var formattedMetersDiamter: String {
        let meters = Measurement(value: diameter?.meters ?? 0, unit: UnitLength.meters)
        return String(format: "%.0f", meters.value.rounded()) + "m"
    }
    
    var formattedTonsMass: String {
        let kg = Measurement(value: mass?.kg ?? 0, unit: UnitMass.kilograms)
        let tons = kg.converted(to: .metricTons).value.rounded()
        return String(format: "%.0f", tons) + "t"
    }
}

// MARK: - Rocket stages

public extension Rocket {
    private var rocketStage1: RocketStage? {
        guard let firstStage = firstStage else { return nil }
        return RocketStage(
            reusable: firstStage.reusable ?? false,
            engines: firstStage.engines ?? 0,
            fuelAmountTons: firstStage.fuelAmountTons ?? 0,
            burnTimeSec: firstStage.burnTimeSec ?? 0,
            isFirstStage: true
        )
    }
    
    private var rocketStage2: RocketStage? {
        guard let secondStage = secondStage else { return nil }
        return RocketStage(
            reusable: secondStage.reusable ?? false,
            engines: secondStage.engines ?? 0,
            fuelAmountTons: secondStage.fuelAmountTons ?? 0,
            burnTimeSec: secondStage.burnTimeSec ?? 0,
            isFirstStage: false
        )
    }
    
    var rocketStages: [RocketStage] {
        guard let stage1 = rocketStage1, let stage2 = rocketStage2 else { return []}
        return [stage1, stage2]
    }
}
