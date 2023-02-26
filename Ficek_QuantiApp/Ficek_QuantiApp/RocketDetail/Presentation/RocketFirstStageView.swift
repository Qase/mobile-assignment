//
//  RocketFirstStageView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketFirstStageView: View {
    let store: StoreOf<RocketDetailDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading, spacing: 16){
                Text("First Stage")
                    .font(.headline)
                Group {
                    HStack(spacing: 16) {
                        Image("Reusable")
                        Text(viewStore.reusableFirstSt)
                    }
                    HStack(spacing: 16) {
                        Image("Engine")
                        Text(viewStore.enginesFirstSt)
                    }
                    HStack(spacing: 16) {
                        Image("Fuel")
                        Text(viewStore.fuelAmmountFirstSt)
                    }
                    HStack(spacing: 16) {
                        Image("Burn")
                        Text(viewStore.burnTimeFirstSt)
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

//struct RocketFirstStageView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketFirstStageView()
//    }
//}
