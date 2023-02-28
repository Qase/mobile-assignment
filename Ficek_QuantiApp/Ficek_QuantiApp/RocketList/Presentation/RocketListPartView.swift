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
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Image("Rocket")
                    .padding(7)
                
                VStack(alignment: .leading) {
                    Text(viewStore.rocket.name)
                        .font(.callout)
                    Text(viewStore.firstFlight)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct RocketListPartView_Previews: PreviewProvider {
    static var previews: some View {
        RocketListPartView(
            store: Store(
                initialState: RocketDetailDomain.State(rocket: .mock),
                reducer: RocketDetailDomain()
            )
        )
    }
}
