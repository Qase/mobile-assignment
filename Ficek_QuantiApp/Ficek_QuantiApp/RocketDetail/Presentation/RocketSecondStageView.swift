//
//  RocketSecondStageView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketSecondStageView: View {
    let store: StoreOf<RocketDetailDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading, spacing: 16){
                Text("Second Stage")
                    .font(.headline)
                Group {
                    HStack(spacing: 16) {
                        Image("Reusable")
                        Text(viewStore.reusableSecondSt)
                    }
                    HStack(spacing: 16) {
                        Image("Engine")
                        Text(viewStore.enginesSecondSt)
                    }
                    HStack(spacing: 16) {
                        Image("Fuel")
                        Text(viewStore.fuelAmmountSecondSt)
                    }
                    HStack(spacing: 16) {
                        Image("Burn")
                        Text(viewStore.burnTimeSecondSt)
                    }
                }
                .font(.subheadline)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.gray).opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct RocketSecondStageView_Previews: PreviewProvider {
    static var previews: some View {
        RocketSecondStageView(
            store: Store(
                initialState: RocketDetailDomain.State(rocket: .mock),
                reducer: RocketDetailDomain()
            )
        )
    }
}
