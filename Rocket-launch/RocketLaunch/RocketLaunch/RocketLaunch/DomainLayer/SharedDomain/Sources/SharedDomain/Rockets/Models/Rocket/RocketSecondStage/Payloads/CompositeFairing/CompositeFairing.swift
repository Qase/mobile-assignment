//
//  CompositeFairing.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

public struct CompositeFairing: Equatable, Hashable {
    public let height: RocketHeight?
    public let diameter: RocketDiameter?
    
    public init(
        height: RocketHeight?,
        diameter: RocketDiameter?
    ) {
        self.height = height
        self.diameter = diameter
    }
}

// Copy constructor
public extension CompositeFairing {
    init(
        copy: CompositeFairing,
        height: RocketHeight? = nil,
        diameter: RocketDiameter? = nil
    ) {
        self.height = height ?? copy.height
        self.diameter = diameter ?? copy.diameter
    }
}
