//
//  RocketLaunchView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketLaunchView: View {
    let store: StoreOf<RocketLaunchDomain>
        
    var body: some View {
        WithViewStore(self.store) { viewStore in
            GeometryReader { geo in
                VStack(spacing: -50){
                    Image(viewStore.image)
                        .padding()
                        .frame(
                            width: geo.size.width,
                            height: 500,
                            alignment: viewStore.isFlying ? .top : .center
                        )
                        .animation(viewStore.animation, value: viewStore.isFlying)
                    
                    Text(viewStore.launchText)
                        .font(.callout)
                        .task {
                            await viewStore.send(.onAppear).finish()
                        }
                }
            }
        }
        .navigationTitle("Launch")
    }
}

struct RocketLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        RocketLaunchView(
            store: Store(
                initialState: RocketLaunchDomain.State(), reducer: RocketLaunchDomain()
            )
        )
    }
}
