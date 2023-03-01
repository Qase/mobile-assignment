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
        var launchText: String { isFlying ? "Launch successfull!" : "Lift the phone to launch the rocket"}
        var animation: Animation = Animation.spring()
    }
    
    enum Action: Equatable {
        case onAppear
        case flying(Double)
    }
    
    @Dependency(\.coreMotionClient) var coreMotionClient
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear:
            return .run { send in
                for try await event in try await self.coreMotionClient.xRotationRate(OperationQueue()) {
                    await send(.flying(event))
                }
            }
            
        case .flying(let result):
            if result > 2 || result < -2 {
                state.isFlying = true
            }
            return .none
        }
    }
}

