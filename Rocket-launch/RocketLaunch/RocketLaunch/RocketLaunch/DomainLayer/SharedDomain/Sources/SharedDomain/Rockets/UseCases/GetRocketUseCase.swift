//
//  GetRocketUseCase.swift
//  
//
//  Created by Tomáš Brand on 18.03.2023.
//

public protocol GetRocketUseCase {
    func execute(id: String) async throws -> Rocket
}

public struct GetRocketUseCaseImpl: GetRocketUseCase {
    
    private let rocketsRepository: RocketsRepository
    
    public init(rocketsRepository: RocketsRepository) {
        self.rocketsRepository = rocketsRepository
    }
    
    public func execute(id: String) async throws -> Rocket {
        try await rocketsRepository.read(id: id)
    }
}
