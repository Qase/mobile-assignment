//
//  RocketDetailDomain.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import Foundation
import ComposableArchitecture
import Dependencies
import Rocket

public struct RocketDetailDomain: ReducerProtocol{
    
    public init() {
        
    }
    
    public struct State: Equatable, Identifiable {
       public var id: String { rocket.id }
       public var name: String { rocket.name }
       public var rocket: Rocket
       public var height: String {"\(Int(round(rocket.height.meters ?? 0)))m"}
       public var diameter: String { "\(Int(round(rocket.diameter.meters ?? 0)))m" }
       public var mass: String { "\(rocket.mass.kg / 1000)t" }
        
       public var reusableFirstSt: String { rocket.firstStage.reusable ? "Reusable" : "Not reusable" }
       public var enginesFirstSt: String { "\(rocket.firstStage.engines) engines" }
       public var fuelAmmountFirstSt: String { "\(rocket.firstStage.fuelAmountTons) tons of fuel"}
       public var burnTimeFirstSt: String {
            rocket.firstStage.burnTimeSEC != nil
                ? "\(String(describing: rocket.firstStage.burnTimeSEC)) seconds burn time"
                : "Data not available"
            }
        
       public var reusableSecondSt: String { rocket.secondStage.reusable ? "Reusable" : "Not reusable" }
       public var firstFlight: String { "First flight: \(rocket.firstFlight)"}
       public var enginesSecondSt: String { "\(rocket.secondStage.engines) engines" }
       public var fuelAmmountSecondSt: String { "\(rocket.secondStage.fuelAmountTons) tons of fuel"}
       public var burnTimeSecondSt: String {  rocket.secondStage.burnTimeSEC != nil
            ? "\(String(describing: rocket.secondStage.burnTimeSEC)) seconds burn time"
            : "Data not available"
        }
        
        public init(rocket: Rocket) {
            self.rocket = rocket
        }
    }
    
    public enum Action: Equatable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        
    }
}
