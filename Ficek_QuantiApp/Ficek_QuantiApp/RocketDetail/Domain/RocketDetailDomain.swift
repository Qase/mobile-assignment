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
    
    struct State: Equatable, Identifiable {
        var id: String { rocket.id }
        var name: String { rocket.name }
        var rocket: Rocket
        var height: String {"\(Int(round(rocket.height.meters ?? 0)))m"}
        var diameter: String { "\(Int(round(rocket.diameter.meters ?? 0)))m" }
        var mass: String { "\(rocket.mass.kg / 1000)t" }
        
        var reusableFirstSt: String { rocket.firstStage.reusable ? "Reusable" : "Not reusable" }
        var enginesFirstSt: String { "\(rocket.firstStage.engines) engines" }
        var fuelAmmountFirstSt: String { "\(rocket.firstStage.fuelAmountTons) tons of fuel"}
        var burnTimeFirstSt: String { if let burnTimeSec = rocket.firstStage.burnTimeSEC {
            return "\(burnTimeSec) seconds burn time"
        } else {
            return "Data not available"
        }}
        
        var reusableSecondSt: String { rocket.secondStage.reusable ? "Reusable" : "Not reusable" }
        var enginesSecondSt: String { "\(rocket.secondStage.engines) engines" }
        var fuelAmmountSecondSt: String { "\(rocket.secondStage.fuelAmountTons) tons of fuel"}
        var burnTimeSecondSt: String { if let burnTimeSec = rocket.secondStage.burnTimeSEC {
            return "\(burnTimeSec) seconds burn time"
        } else {
            return "Data not available"
        }}
    }
    
    enum Action: Equatable {
      
    
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
       
    }
}
