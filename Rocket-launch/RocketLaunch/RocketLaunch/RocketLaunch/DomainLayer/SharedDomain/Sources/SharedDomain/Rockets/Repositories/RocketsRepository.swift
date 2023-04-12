//
//  RocketsRepository.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

public protocol RocketsRepository {
    func read(id: String) async throws -> Rocket
    func readList(page: Int) async throws -> [Rocket]
}
