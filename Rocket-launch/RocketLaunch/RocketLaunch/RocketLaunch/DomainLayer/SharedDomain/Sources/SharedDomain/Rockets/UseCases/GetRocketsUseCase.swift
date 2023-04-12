//
//  GetRocketsUseCase.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

public protocol GetRocketsUseCase {
    func execute(page: Int) async throws -> [Rocket]
}

public struct GetRocketsUseCaseImpl: GetRocketsUseCase {
    
    private let rocketsRepository: RocketsRepository
    
    public init(rocketsRepository: RocketsRepository) {
        self.rocketsRepository = rocketsRepository
    }
    
    public func execute(page: Int) async throws -> [Rocket] {
        try await rocketsRepository.readList(page: page)
    }
}
