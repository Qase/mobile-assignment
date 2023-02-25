//
//  RocketListPartView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketListPartView: View {
    let store: StoreOf<RocketDetailDomain>
    let rocket: Rocket

    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Image("Rocket")
                
                VStack(alignment: .leading) {
                    Text(rocket.rocketName)
                        .font(.callout)
                    Text(rocket.firstFlight)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

//struct RocketListPartView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketListPartView(store: Store<RocketDetailDomain.State, RocketDetailDomain.Action>)
//    }
//}
