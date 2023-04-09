//
//  RocketListDomain.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 25.02.2023.
//

import Foundation
import ComposableArchitecture
import Dependencies
import Rocket
import RocketRepository
import RocketDetail
import RocketClient
import Combine

public struct RocketListDomain: ReducerProtocol{
    
    public init() {
    }
    
   public struct State: Equatable {
       public var rocketItems: IdentifiedArrayOf<RocketDetailDomain.State> = []
      // var isLoading: Bool = true
      // var cancellables = Set<AnyCancellable>()
       
       public init() {
       }
    }
    
   public enum Action {
        case task
        case fetchRockets(TaskResult<[Rocket]>)
        case rockets(id: RocketDetailDomain.State.ID, action: RocketDetailDomain.Action)
        
      //  case rocketTask
      // case fetchR(EffectTask<[Rocket]>)
    }
    
    @Dependency(\.rocketRepository.fetchAllRockets) var fetchAllRockets
    //@Dependency(\.rocketClient.fetchAllRockets) var fetchRR
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .task:
                return .task {
                    await .fetchRockets(
                        TaskResult {
                            return try await fetchAllRockets()
                        }
                    )
                }
                
            case .fetchRockets(.success(let result)):
                state.rocketItems = IdentifiedArrayOf(
                    uniqueElements: result.map { RocketDetailDomain.State(rocket: $0)
                    }
                )
                return .none
                
            case .fetchRockets(.failure(let error)):
                print(error)
                return .none
//            case .fetchR:
//
//                return .task {
//                    EffectTask {
//                        fetchRR()
//                            .eraseToEffect()
//                    }
//                }
//
//                var rockett: Array<Rocket> = []
//
//                fetchRR()
//                    .sink(
//                        receiveCompletion: { completetion in
//                            switch completetion {
//                            case .finished: break
//                            case .failure(let error):
//                                print(error)
//                                break
//                            }
//                        },
//                        receiveValue: { rocket in
//                            rockett = rocket
//                        }
//                    )
//                    .store(in: &state.cancellables)
//
//                state.rocketItems = IdentifiedArrayOf(
//                    uniqueElements: rockett.map { RocketDetailDomain.State(rocket: $0)
//                    }
//                )
//                return .none
//            case .rocketTask:
//
////                state.rocketItems = IdentifiedArrayOf(
////                    uniqueElements: result.map { RocketDetailDomain.State(rocket: $0)
////                    }
////                )
//                  return  .none
            }
        }
        .forEach(\.rocketItems, action: /Action.rockets(id:action:)) {
            RocketDetailDomain()
        }
    }
}



