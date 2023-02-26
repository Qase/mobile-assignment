//
//  RocketListDomain.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 25.02.2023.
//

import Foundation
import ComposableArchitecture
import Dependencies

struct RocketListDomain: ReducerProtocol{
    
    struct State: Equatable {
        var rocketItems: IdentifiedArrayOf<RocketDetailDomain.State> = []
    }
    
    enum Action: Equatable {
        case onAppear
        case fetchRockets(TaskResult<[Rocket]>)
        case rockets(id: RocketDetailDomain.State.ID, action: RocketDetailDomain.Action)
    }
    
    @Dependency(\.rocketRepositoryClient) var rocketRepositoryClient
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:

                return .task {
                    await .fetchRockets(
                        TaskResult {
                            return try await rocketRepositoryClient.fetchAllRockets()
                        }
                    )
                }
                
            case .fetchRockets(.success(let result)):
                state.rocketItems = IdentifiedArrayOf(uniqueElements: result.map{ RocketDetailDomain.State(rocket: $0)})
                return .none
            case .fetchRockets(.failure(let error)):
                print(error)
                return .none
            }
        }
        .forEach(\.rocketItems, action: /Action.rockets(id:action:)) {
            RocketDetailDomain()
        }
    }
}



