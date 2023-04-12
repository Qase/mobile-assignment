//
//  RocketStage.swift
//  
//
//  Created by Tomáš Brand on 30.03.2023.
//

public struct RocketStage: Equatable, Hashable {
    public let reusable: Bool
    public let engines: Double
    public let fuelAmountTons: Double
    public let burnTimeSec: Double
    public let isFirstStage: Bool
    
    public init(
        reusable: Bool,
        engines: Double,
        fuelAmountTons: Double,
        burnTimeSec: Double,
        isFirstStage: Bool
    ) {
        self.reusable = reusable
        self.engines = engines
        self.fuelAmountTons = fuelAmountTons
        self.burnTimeSec = burnTimeSec
        self.isFirstStage = isFirstStage
    }
}

// Copy constructor
public extension RocketStage {
    init(
        copy: RocketStage,
        reusable: Bool? = nil,
        engines: Double? = nil,
        fuelAmountTons: Double? = nil,
        burnTimeSec: Double? = nil,
        isFirstStage: Bool? = nil
    ) {
        self.reusable = reusable ?? copy.reusable
        self.engines = engines ?? copy.engines
        self.fuelAmountTons = fuelAmountTons ?? copy.fuelAmountTons
        self.burnTimeSec = burnTimeSec ?? copy.burnTimeSec
        self.isFirstStage = isFirstStage ?? copy.isFirstStage
    }
}
