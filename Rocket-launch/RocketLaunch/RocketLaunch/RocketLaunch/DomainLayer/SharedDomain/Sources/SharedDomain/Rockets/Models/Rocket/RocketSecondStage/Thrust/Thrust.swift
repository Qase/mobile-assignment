//
//  Thrust.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

public struct Thrust: Equatable, Hashable {
    public let kN: Double
    public let lbf: Double
    
    public init(
        kN: Double,
        lbf: Double
    ) {
        self.kN = kN
        self.lbf = lbf
    }
}

// Copy constructor
public extension Thrust {
    init(
        copy: Thrust,
        kN: Double? = nil,
        lbf: Double? = nil
    ) {
        self.kN = kN ?? copy.kN
        self.lbf = lbf ?? copy.lbf
    }
}
