//
//  RocketDetailView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture
import RocketLaunch

public struct RocketDetailView: View {
    public let store: StoreOf<RocketDetailDomain>
    
    public init(store: StoreOf<RocketDetailDomain>) {
        self.store = store
    }
    
   public var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView {
                VStack(alignment: .leading) {
                    RocketParametersView(store: store)
                    RocketFirstStageView(store: store)
                        .padding()
                    RocketSecondStageView(store: store)
                        .padding()
                    RocketPhotosView(store: store)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    NavigationLink(
                        destination: {
                            RocketLaunchView(
                                store:  Store(
                                    initialState: RocketLaunchDomain.State(),
                                    reducer: RocketLaunchDomain()
                                )
                            )
                        },
                        label: {
                            Text("Launch")
                        }
                    )
                }
            }
            .navigationTitle(viewStore.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RocketDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        RocketDetailView(
            store: Store(
                initialState: RocketDetailDomain.State(rocket: .mock),
                reducer: RocketDetailDomain()
            )
        )
    }
}
