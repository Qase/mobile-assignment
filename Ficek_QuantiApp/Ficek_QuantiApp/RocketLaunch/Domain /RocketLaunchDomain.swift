//
//  RocketLaunchDomain.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 26.02.2023.
//

import Foundation
import ComposableArchitecture
import Dependencies
import SwiftUI


struct RocketLaunchDomain: ReducerProtocol{
    
    struct State: Equatable {
        var isFlying: Bool = false
        var image: String { isFlying ? "Rocket Flying" : "Rocket Idle"}
        var launchText: String { isFlying ? "Rocket launched!" : "Lift the phone to launch the rocket"}
        var animation: Animation = Animation.spring()
    }
    
    enum Action: Equatable {
        case onAppear
        case task(TaskResult<Bool>)
    }
    
    @Dependency(\.coreMotionClient) var coreMotionClient
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear:
            return .task {
                await .task(
                    TaskResult {
                        return try await coreMotionClient.gyro() > 1
                    }
                )
            }
                    
        case .task(.success(let result)):
            if result == false {
                return .send(.onAppear)
            }
            else {
                    state.isFlying = true
            }
           
            return .none
            
        case .task(.failure(let error)):
            return .none
        }
    }
}
