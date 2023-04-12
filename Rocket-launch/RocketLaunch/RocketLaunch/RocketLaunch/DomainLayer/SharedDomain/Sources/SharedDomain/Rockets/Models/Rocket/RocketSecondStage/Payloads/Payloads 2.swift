//
//  Payloads.swift
//  
//
//  Created by Tomáš Brand on 25.03.2023.
//

public struct Payloads: Equatable, Hashable {
    public let compositeFairing: CompositeFairing?
    public let option1: String
    
    public init(
        compositeFairing: CompositeFairing?,
        option1: String
    ) {
        self.compositeFairing = compositeFairing
        self.option1 = option1
    }
}

// Copy constructor
public extension Payloads {
    init(
        copy: Payloads,
        compositeFairing:  CompositeFairing? = nil,
        option1: String? = nil
    ) {
        self.compositeFairing = compositeFairing ?? copy.compositeFairing
        self.option1 = option1 ?? copy.option1
    }
}
