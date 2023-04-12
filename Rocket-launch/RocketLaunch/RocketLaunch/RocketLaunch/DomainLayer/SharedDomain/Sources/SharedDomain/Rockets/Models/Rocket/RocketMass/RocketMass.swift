//
//  RocketMass.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

public struct RocketMass: Equatable, Hashable {
    public let kg: Double
    public let lb: Double
    
    public init(
        kg: Double,
        lb: Double
    ) {
        self.kg = kg
        self.lb = lb
    }
}

// Copy constructor
public extension RocketMass {
    init(
        copy: RocketMass,
        kg: Double? = nil,
        lb: Double? = nil
    ) {
        self.kg = kg ?? copy.kg
        self.lb = lb ?? copy.lb
    }
}

