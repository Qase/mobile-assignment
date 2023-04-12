//
//  RocketsRepository.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import NetworkProvider
import SharedDomain

public struct RocketsRepositoryImpl: RocketsRepository {
    
    private let network: NetworkProvider
    
    public init(networkProvider: NetworkProvider) {
        network = networkProvider
    }
    
    public func read(id: String) async throws -> Rocket {
        let endpoint = RocketsAPI.read(id)
        let rocket = try await network.request(endpoint).map(NETRocket.self).domainModel
        return rocket
    }
    
    public func readList(page: Int) async throws -> [Rocket] {
        let endpoint = RocketsAPI.readList(page)
        let rockets = try await network.request(endpoint).map([NETRocket].self).map { $0.domainModel }
        return rockets
    }
}
