//
//  RocketDetailDomain.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import Foundation
import ComposableArchitecture
import Dependencies

struct RocketDetailDomain: ReducerProtocol{
    
    struct State: Equatable {
        var rocketItems: IdentifiedArrayOf<Rocket> = []
    }
    
    enum Action: Equatable {
        case onAppear
        case fetchRockets(TaskResult<[Rocket]>)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case .onAppear:
            @Dependency(\.rocketRepositoryClient) var rocketRepositoryClient
            return .task {
                await .fetchRockets(
                    TaskResult {
                        return try await rocketRepositoryClient.fetchAllRockets()
                    }
                )
                
            }
        case .fetchRockets(.success(let result)):
            state.rocketItems = IdentifiedArray(uniqueElements: result)
            return .none
        case .fetchRockets(.failure(let error)):
            print(error)
            return .none
        }
    }
}
