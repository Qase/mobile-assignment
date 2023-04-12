//
//  RocketDiameter.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

public struct RocketDiameter: Equatable, Hashable {
    public let meters: Double
    public let feet: Double
    
    public init(
        meters: Double,
        feet: Double
    ) {
        self.meters = meters
        self.feet = feet
    }
}

// Copy constructor
public extension RocketDiameter {
    init(
        copy: RocketDiameter,
        meters: Double? = nil,
        feet: Double? = nil
    ) {
        self.meters = meters ?? copy.meters
        self.feet = feet ?? copy.feet
    }
}
