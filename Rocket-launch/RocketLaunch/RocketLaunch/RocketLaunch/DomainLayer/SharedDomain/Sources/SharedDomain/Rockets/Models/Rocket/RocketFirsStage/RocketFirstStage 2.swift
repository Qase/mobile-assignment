//
//  RocketFirstStage.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

public struct RocketFirstStage: Equatable, Hashable {
    public let reusable: Bool?
    public let engines: Double?
    public let fuelAmountTons: Double?
    public let burnTimeSec: Double?
    
    public init(
        reusable: Bool?,
        engines: Double?,
        fuelAmountTons: Double?,
        burnTimeSec: Double?
    ) {
        self.reusable = reusable
        self.engines = engines
        self.fuelAmountTons = fuelAmountTons
        self.burnTimeSec = burnTimeSec
    }
}

// Copy constructor
public extension RocketFirstStage {
    init(
        copy: RocketFirstStage,
        reusable: Bool? = nil,
        engines: Double? = nil,
        fuelAmountTons: Double? = nil,
        burnTimeSec: Double? = nil
    ) {
        self.reusable = reusable ?? copy.reusable
        self.engines = engines ?? copy.engines
        self.fuelAmountTons = fuelAmountTons ?? copy.fuelAmountTons
        self.burnTimeSec = burnTimeSec ?? copy.burnTimeSec
    }
}
