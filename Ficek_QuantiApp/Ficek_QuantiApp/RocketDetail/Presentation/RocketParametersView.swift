//
//  RocketParametersView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketParametersView: View {
    let store: StoreOf<RocketDetailDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading, spacing: 16) {
                Text("Overview")
                    .font(.headline)
                Text(viewStore.rocket.description)
                    .font(.subheadline)
                Text("Parameters")
                    .font(.headline)
                HStack(spacing: 16) {
                    Group {
                        VStack(spacing: 4) {
                            Text(viewStore.height)
                                .font(.system(size: 24))
                                .bold()
                            Text("height")
                                .font(.headline)
                        }
                        VStack(spacing: 4) {
                            Text(viewStore.diameter)
                                .font(.system(size: 24))
                                .bold()
                            Text("diameter")
                                .font(.headline)
                        }
                        VStack(spacing: 4) {
                            Text(viewStore.mass)
                                .font(.system(size: 24))
                                .bold()
                            Text("mass")
                                .font(.headline)
                        }
                    }
                    .frame(width: 110, height: 110)
                    .background (
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color("PinkAsImages"))
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .foregroundColor(Color.white)
            }
            .padding()
        }
    }
}

struct RocketParametersView_Previews: PreviewProvider {
    static var previews: some View {
        RocketParametersView(
            store: Store(
                initialState: RocketDetailDomain.State(rocket: .mock),
                reducer: RocketDetailDomain()
            )
        )
    }
}
