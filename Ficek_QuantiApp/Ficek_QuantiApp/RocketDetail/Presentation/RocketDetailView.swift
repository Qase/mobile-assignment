//
//  RocketDetailView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketDetailView: View {
    let store: StoreOf<RocketDetailDomain>
    
    var body: some View {
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
                NavigationStack {
                    NavigationLink(destination: {
                        RocketLaunchView(store:
                                            Store(initialState:
                                                    RocketLaunchDomain.State(),
                                                  reducer: RocketLaunchDomain()
                                                 )
                        )
                    }, label: {
                        Text("Launch")
                    })
                }
            }
        }
    }
}
//struct RocketDetailView_Previews: PreviewProvider {
//    let mock = Mock()
//
//    static var previews: some View {
//        RocketDetailView(store: Store(initialState: RocketDetailDomain.State(rocket: mock.mock.first!), reducer: RocketListDomain()._printChanges())
//        )
//    }
//}
