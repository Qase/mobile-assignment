//
//  RocketListDomain.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 25.02.2023.
//

import Foundation
import ComposableArchitecture
import Rocket
import RocketDetail
import RocketClient
import Combine

public struct RocketListDomain: ReducerProtocol{
    
    public init() {
    }
    
   public struct State: Equatable {
       public var rocketItems: IdentifiedArrayOf<RocketDetailDomain.State> = []
       
       public init() {
       }
    }
    
   public enum Action {
        case rockets(id: RocketDetailDomain.State.ID, action: RocketDetailDomain.Action)
        
        case task
        case fetchRockets(Result<[Rocket], RocketError>)
    }
    
    @Dependency(\.rocketClient.fetchAllRockets) var fetchAllRockets
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
           
            case .task:
                return fetchAllRockets()
                    .receive(on: DispatchQueue.main)
                    .catchToEffect(Action.fetchRockets)

            case .fetchRockets(.success(let result)):
                state.rocketItems = IdentifiedArrayOf(
                    uniqueElements: result.map { RocketDetailDomain.State(rocket: $0)
                    }
                )
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



